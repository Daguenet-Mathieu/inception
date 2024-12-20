all:
	mkdir -p /home/madaguen/data/mariadb
	mkdir -p /home/madaguen/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d --build

clean:
	docker compose -f srcs/docker-compose.yml down

fclean: clean
	sudo rm -rf /home/madaguen/data
	docker system prune -af

re: fclean all

.PHONY: all clean logs fclean
