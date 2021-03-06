RADPHP_USER=radphp
RADPHP_GROUP=radphp

help:
	@echo '    ____            ______  __  ______     ___              '
	@echo '   / __ \____ _____/ / __ \/ / / / __ \   /   |  ____  ____ '
	@echo '  / /_/ / __ `/ __  / /_/ / /_/ / /_/ /  / /| | / __ \/ __ \'
	@echo ' / _, _/ /_/ / /_/ / ____/ __  / ____/  / ___ |/ /_/ / /_/ /'
	@echo '/_/ |_|\__,_/\__,_/_/   /_/ /_/_/      /_/  |_/ .___/ .___/ '
	@echo '                                             /_/   /_/      '
	@echo ""
	@echo ""
	@echo "up"
	@echo "  Create and start RadPHP application."
	@echo ""
	@echo "status"
	@echo "  Shows the status of the current RadPHP application."
	@echo ""
	@echo "shell"
	@echo "  Starting a zsh shell as \"radphp\" user in web container."
	@echo ""
	@echo "shell-as-root"
	@echo "  Starting a bash shell as \"root\" user in web container."
	@echo ""
	@echo "destroy"
	@echo "  Stop and remove containers, networks, images, and volumes."
	@echo ""
	@echo "provision"
	@echo "  Run the provisioner."
	@echo ""
	@echo "update"
	@echo "  Update all codes."
	@echo ""

up:
	docker-compose up -d

update:
	docker-compose exec -T --user=$(RADPHP_USER) web composer --working-dir '$RADPHP_INSTALL_DIR' update --optimize-autoloader

status:
	docker-compose ps

destroy:
	docker-compose down

shell:
	docker-compose exec --user=$(RADPHP_USER) web ash

shell-as-root:
	docker-compose exec web ash