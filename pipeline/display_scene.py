
volume_path = '/home/lab/nnUNet_data/nnUNet_raw_data_base/nnUNet_raw_data/Task502_BrainMetastases/imagesTr/FSRTCASE_001_0000.nii.gz'
segmentation_path = '/home/lab/nnUNet_data/nnUNet_raw_data_base/nnUNet_raw_data/Task502_BrainMetastases/labelsTr/FSRTCASE_001.nii.gz'

# Load volume
volume = slicer.util.loadVolume(volume_path)

# Load segmentation
segmentation = slicer.util.loadSegmentation(segmentation_path)

# Get first segment in segmentation (in our case, there should always only be one)
segment = segmentation.GetSegmentation().GetNthSegment(0)

# Extract name of segment 
segment_name = segment.GetName()

# Create segmentation display node
segmentationDisplayNode = segmentation.GetDisplayNode()

# Set visibility of segment (corresponding to tumor) to True (it is false by default)
segmentationDisplayNode.SetSegmentVisibility(segment_name, True)
