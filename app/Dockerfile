FROM nialljb/freesurfer7.4.1-ants2.4-fsl AS base

############################

# shell settings
WORKDIR /freesurfer

# configure local app structure
ENV HOME=/root/
ENV APPDIR="/app"

WORKDIR $APPDIR
RUN mkdir -p $APPDIR/input
RUN mkdir -p $APPDIR/output
RUN mkdir -p $APPDIR/work

# Copy your application files
COPY . $APPDIR/

# Remove Flywheel-specific pip installs - these are no longer needed
# RUN pip3 install flywheel-gear-toolkit && \
#     pip3 install --upgrade flywheel-sdk

# Install any other requirements your gear needs
# RUN pip3 install -r requirements.txt

# Configure permissions for executable files
RUN chmod +xwr $APPDIR/run.py && \
    chmod +xwr $APPDIR/main.sh && \
    find $APPDIR -name "*.sh" -exec chmod +x {} \;

# Set working directory for execution
WORKDIR $APPDIR

# Configure entrypoint to run the simplified script
ENTRYPOINT ["python3", "/app/run.py"]