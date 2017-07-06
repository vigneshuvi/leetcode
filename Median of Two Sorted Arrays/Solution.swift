class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let nLen1:Int = nums1.count;
        let nLen2:Int = nums2.count;
        if(nLen1 == 0 && nLen2 == 0) {
            return -1;
        } else if(nLen1 > 0 && nLen2 == 0)
        {
            if(nLen1 % 2 == 1) {
                return Double(nums1[(nLen1/2)]);
            } else {
                return (Double(nums1[(nLen1/2)-1]) + Double(nums1[(nLen1/2)]))/2;
            }
        } else if(nLen1 == 0 && nLen2 > 0) {
            if(nLen2 % 2 == 1) {
                return Double(nums2[(nLen2/2)]);
            } else {
                return (Double(nums2[(nLen2/2)-1]) + Double(nums2[(nLen2/2)]))/2;
            }
        } else {
            var i :Int = 0, j = 0, k = 0;
            var nums3 = [Int](repeating: 0, count: nLen1+nLen2)
            // Traverse both array
            while (i < nLen1 && j < nLen2)
            {
                // Check if current element of first
                // array is smaller than current element
                // of second array. If yes, store first
                // array element and increment first array
                // index. Otherwise do same with second array
                
                if ( nums1[i] < nums2[j] ) {
                    
                    nums3[k] = nums1[i];
                    i=i+1;
                } else {
                    nums3[k] = nums2[j];
                    j = j+1;
                }
                k = k+1;
                
            }
            
            // Store remaining elements of first array
            while (i < nLen1) {
                
                nums3[k] = nums1[i];
                k = k+1;
                i=i+1;
            }
            
            
            // Store remaining elements of second array
            while (j < nLen2) {
                
                nums3[k] = nums2[j];
                k = k+1;
                j=j+1;
            }
            
            let nLen3:Int = nums3.count;
            if(nLen3 % 2 == 1) {
                return Double(nums3[(nLen3/2)]);
            } else {
                return (Double(nums3[(nLen3/2)-1]) + Double(nums3[(nLen3/2)]))/2;
            }
        }
    }
}
