COMPOSE= -f docker-compose.yml

all: build run

run:
	@mkdir -p chain_vol
	@docker compose ${COMPOSE} up -d

build:
	@mkdir -p chain_vol
	@docker compose ${COMPOSE} build --no-cache --pull

down:
	@docker compose ${COMPOSE} down

stop:
	@docker compose ${COMPOSE} stop

up:
	@docker compose ${COMPOSE} up -d

clean:
	@docker compose ${COMPOSE} down --volumes --rmi all --remove-orphans

fclean: clean
	@docker system prune --all
	@docker builder prune --all
	@sudo rm -rf chain_vol

re: fclean run

.PHONY: all run build build_run down clean fclean re