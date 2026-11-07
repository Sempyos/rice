#Base Directory
base := ~/rice/config/

#Git Directory
git := ~/rice/

#Config Directory
config := ~/.config/

#Apps
apps := bottom ewwii fish fnott foot fuzzel harper-ls helix matugen mpv niri obs-studio yazi systemd
appst := $(foreach app,$(apps),$(eval $(app) := $(config)$(app)))

Quartz:
	@mkdir -p $(base)
	@echo "Created Backup Directory:" $(base)

copy = cp -rf $($(1)) $(base)

Backup: Quartz
	@$(foreach app,$(apps),$(call copy,$(app));)
	@git -C $(git) add .
	@echo "Added Files to Git"
	@git -C $(git) commit -m "Update"
	@echo "Commit Made"
	@git -C $(git) push --force
	@echo "Backup Complete"

restore = cp -rf $(base)$(1)/ $(config)

Restore:
	@git clone https://github.com/sempyos/rice
	@echo "Downloaded Configuration"
	@$(foreach app,$(apps),$(call restore,$(app));)
	
Push:
	@git -C $(git) add .
	@read -p "Commit Name: " commit;
	@git -C $(git) commit -m "$commit";
	git -C $(git) push --force
