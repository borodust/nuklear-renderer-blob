(asdf:defsystem nuklear-renderer-blob
  :description "Nuklear IM GUI renderer foreign library collection"
  :license "MIT"
  :author "Pavel Korolev"
  :defsystem-depends-on (:bodge-blobs-support)
  :depends-on (:glad-blob)
  :class :bodge-blob-system
  :libraries (((:darwin :x86-64) "libnkrenderer.dylib" "x86_64/")
              ((:darwin :x86) "libnkrenderer.dylib" "x86/")
              ((:unix (:not :darwin) :x86-64) "libnkrenderer.so" "x86_64/")
              ((:unix (:not :darwin) :x86) "libnkrenderer.so" "x86/")
              ((:unix (:not :darwin) :ppc64 :big-endian) "libnkrenderer.so" "ppc64/")
              ((:unix (:not :darwin) :ppc64 :little-endian) "libnkrenderer.so" "ppc64le/")
              ((:windows :x86-64) "libnkrenderer.dll" "x86_64/")
              ((:windows :x86) "libnkrenderer.dll" "x86/"))
  :perform (asdf:load-op :before (o c)
                         #+darwin
                         (uiop:symbol-call :bodge-blobs-support 'link-system-foreign-libraries
                                           :nuklear-renderer-blob #+x86 "x86/" #+x86-64 "x86_64/")))
