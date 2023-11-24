
# Use the official image as a parent image
FROM ubuntu

# Update the system
RUN apt-get update && apt-get upgrade -y

RUN apt-get install shellinabox

# a new user is needed to get access to the container
RUN useradd admin
RUN echo "admin:forgetit" | chpasswd

#this is needed to gain root access
RUN echo "root:forgetit" | chpasswd

EXPOSE 4200

CMD ["shellinaboxd", "-s", "/:LOGIN", "--disable-ssl"]
