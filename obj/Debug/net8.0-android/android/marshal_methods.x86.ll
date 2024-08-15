; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [315 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [624 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 235
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 269
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 6: Newtonsoft.Json.dll => 0x254c520 => 193
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 310
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 192
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 253
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 253
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 273
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 209
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 255
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 307
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 308
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 207
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 229
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 35: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 36: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 212
	i32 276479776, ; 37: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 38: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 231
	i32 280482487, ; 39: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 228
	i32 280992041, ; 40: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 279
	i32 291076382, ; 41: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 42: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 43: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 307
	i32 318968648, ; 44: Xamarin.AndroidX.Activity.dll => 0x13031348 => 198
	i32 321597661, ; 45: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 46: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 292
	i32 342366114, ; 47: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 230
	i32 356389973, ; 48: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 291
	i32 360082299, ; 49: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 50: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 51: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 52: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 53: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 54: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 55: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 56: _Microsoft.Android.Resource.Designer => 0x17969339 => 311
	i32 403441872, ; 57: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 58: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 303
	i32 441335492, ; 59: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 213
	i32 442565967, ; 60: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 61: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 226
	i32 451504562, ; 62: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 63: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 64: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 65: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 66: System.dll => 0x1bff388e => 164
	i32 476646585, ; 67: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 228
	i32 486930444, ; 68: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 241
	i32 498788369, ; 69: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 70: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 290
	i32 503918385, ; 71: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 284
	i32 513247710, ; 72: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 186
	i32 526420162, ; 73: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 74: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 273
	i32 530272170, ; 75: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 76: Microsoft.Extensions.Logging => 0x20216150 => 182
	i32 540030774, ; 77: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 78: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 79: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 80: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 81: Jsr305Binding => 0x213954e7 => 266
	i32 569601784, ; 82: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 264
	i32 577335427, ; 83: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 84: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 298
	i32 592892774, ; 85: BookVerse => 0x2356d366 => 0
	i32 597488923, ; 86: CommunityToolkit.Maui => 0x239cf51b => 173
	i32 601371474, ; 87: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 88: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 89: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 621723884, ; 90: BookVerse.dll => 0x250ec0ec => 0
	i32 627609679, ; 91: Xamarin.AndroidX.CustomView => 0x2568904f => 218
	i32 627931235, ; 92: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 296
	i32 639843206, ; 93: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 224
	i32 643868501, ; 94: System.Net => 0x2660a755 => 81
	i32 662205335, ; 95: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 96: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 260
	i32 666292255, ; 97: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 205
	i32 672442732, ; 98: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 99: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 100: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 278
	i32 690569205, ; 101: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 102: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 275
	i32 693804605, ; 103: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 104: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 105: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 270
	i32 700358131, ; 106: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 107: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 293
	i32 709557578, ; 108: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 281
	i32 720511267, ; 109: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 274
	i32 722857257, ; 110: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 111: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 112: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 113: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 195
	i32 759454413, ; 114: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 115: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 116: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 117: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 302
	i32 789151979, ; 118: Microsoft.Extensions.Options => 0x2f0980eb => 185
	i32 790371945, ; 119: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 219
	i32 804715423, ; 120: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 121: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 233
	i32 823281589, ; 122: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 123: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 124: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 125: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 126: Xamarin.AndroidX.Print => 0x3246f6cd => 246
	i32 873119928, ; 127: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 128: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 129: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 130: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 131: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 132: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 305
	i32 928116545, ; 133: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 269
	i32 952186615, ; 134: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 135: Newtonsoft.Json => 0x38f24a24 => 193
	i32 956575887, ; 136: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 274
	i32 966729478, ; 137: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 267
	i32 967690846, ; 138: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 230
	i32 975236339, ; 139: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 140: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 141: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 142: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 143: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 144: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 145: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 146: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 250
	i32 1019214401, ; 147: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 148: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 181
	i32 1029334545, ; 149: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 280
	i32 1031528504, ; 150: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 268
	i32 1035644815, ; 151: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 203
	i32 1036536393, ; 152: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 153: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 154: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 237
	i32 1067306892, ; 155: GoogleGson => 0x3f9dcf8c => 177
	i32 1082857460, ; 156: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 157: Xamarin.Kotlin.StdLib => 0x409e66d8 => 271
	i32 1098259244, ; 158: System => 0x41761b2c => 164
	i32 1118262833, ; 159: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 293
	i32 1121599056, ; 160: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 236
	i32 1127624469, ; 161: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 184
	i32 1149092582, ; 162: Xamarin.AndroidX.Window => 0x447dc2e6 => 263
	i32 1168523401, ; 163: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 299
	i32 1170634674, ; 164: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 165: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 259
	i32 1178241025, ; 166: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 244
	i32 1203215381, ; 167: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 297
	i32 1204270330, ; 168: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 205
	i32 1208641965, ; 169: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 170: CommunityToolkit.Mvvm => 0x4868cc7b => 175
	i32 1219128291, ; 171: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 172: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 295
	i32 1243150071, ; 173: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 264
	i32 1253011324, ; 174: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 175: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 279
	i32 1264511973, ; 176: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 254
	i32 1267360935, ; 177: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 258
	i32 1273260888, ; 178: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 210
	i32 1275534314, ; 179: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 275
	i32 1278448581, ; 180: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 202
	i32 1293217323, ; 181: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 221
	i32 1309188875, ; 182: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 183: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 263
	i32 1324164729, ; 184: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 185: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 186: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 187: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 309
	i32 1376866003, ; 188: Xamarin.AndroidX.SavedState => 0x52114ed3 => 250
	i32 1379779777, ; 189: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 190: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 191: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 214
	i32 1408764838, ; 192: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 193: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 194: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 195: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 277
	i32 1434145427, ; 196: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 197: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 267
	i32 1439761251, ; 198: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 199: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 200: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 201: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 202: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 203: es\Microsoft.Maui.Controls.resources => 0x57152abe => 283
	i32 1461234159, ; 204: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 205: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 206: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 207: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 204
	i32 1470490898, ; 208: Microsoft.Extensions.Primitives => 0x57a5e912 => 186
	i32 1479771757, ; 209: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 210: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 211: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 212: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 251
	i32 1493001747, ; 213: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 287
	i32 1514721132, ; 214: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 282
	i32 1536373174, ; 215: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 216: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 217: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 218: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 219: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 302
	i32 1565862583, ; 220: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 221: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 222: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 223: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 224: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 220
	i32 1592978981, ; 225: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 226: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 268
	i32 1601112923, ; 227: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 228: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 229: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 230: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 240
	i32 1622358360, ; 231: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 232: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 262
	i32 1634654947, ; 233: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 174
	i32 1635184631, ; 234: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 224
	i32 1636350590, ; 235: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 217
	i32 1639515021, ; 236: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 237: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 238: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 239: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 240: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 256
	i32 1658251792, ; 241: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 265
	i32 1670060433, ; 242: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 212
	i32 1675553242, ; 243: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 244: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 245: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 246: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 247: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 248: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 249: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 272
	i32 1701541528, ; 250: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 251: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 233
	i32 1726116996, ; 252: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 253: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 254: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 208
	i32 1736233607, ; 255: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 300
	i32 1743415430, ; 256: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 278
	i32 1744735666, ; 257: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 258: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 259: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 260: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 261: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 262: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 263: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 255
	i32 1770582343, ; 264: Microsoft.Extensions.Logging.dll => 0x6988f147 => 182
	i32 1776026572, ; 265: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 266: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 267: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 268: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 294
	i32 1788241197, ; 269: Xamarin.AndroidX.Fragment => 0x6a96652d => 226
	i32 1793755602, ; 270: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 286
	i32 1808609942, ; 271: Xamarin.AndroidX.Loader => 0x6bcd3296 => 240
	i32 1813058853, ; 272: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 271
	i32 1813201214, ; 273: Xamarin.Google.Android.Material => 0x6c13413e => 265
	i32 1818569960, ; 274: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 245
	i32 1818787751, ; 275: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 276: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 277: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 278: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 183
	i32 1842015223, ; 279: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 306
	i32 1847515442, ; 280: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 195
	i32 1853025655, ; 281: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 303
	i32 1858542181, ; 282: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 283: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 284: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 285
	i32 1879696579, ; 285: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 286: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 206
	i32 1888955245, ; 287: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 288: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 289: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 290: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 291: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 292: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 293: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 294: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 252
	i32 1968388702, ; 295: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 178
	i32 1983156543, ; 296: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 272
	i32 1985761444, ; 297: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 197
	i32 2003115576, ; 298: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 282
	i32 2011961780, ; 299: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 300: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 237
	i32 2025202353, ; 301: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 277
	i32 2031763787, ; 302: Xamarin.Android.Glide => 0x791a414b => 194
	i32 2045470958, ; 303: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 304: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 232
	i32 2060060697, ; 305: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 306: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 281
	i32 2070888862, ; 307: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 308: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 309: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 310: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 311: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 312: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 313: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 314: Microsoft.Maui => 0x80bd55ad => 190
	i32 2169148018, ; 315: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 289
	i32 2181898931, ; 316: Microsoft.Extensions.Options.dll => 0x820d22b3 => 185
	i32 2192057212, ; 317: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 183
	i32 2193016926, ; 318: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 319: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 276
	i32 2201231467, ; 320: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 321: it\Microsoft.Maui.Controls.resources => 0x839595db => 291
	i32 2216717168, ; 322: Firebase.Auth.dll => 0x84206b70 => 176
	i32 2217644978, ; 323: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 259
	i32 2222056684, ; 324: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 325: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 241
	i32 2252106437, ; 326: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 327: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 328: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 329: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 179
	i32 2267999099, ; 330: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 196
	i32 2270573516, ; 331: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 285
	i32 2279755925, ; 332: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 248
	i32 2293034957, ; 333: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 334: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 335: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 336: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 295
	i32 2305521784, ; 337: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 338: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 200
	i32 2320631194, ; 339: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 340: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 341: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 342: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 343: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 344: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 178
	i32 2378619854, ; 345: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 346: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 347: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 290
	i32 2401565422, ; 348: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 349: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 223
	i32 2421380589, ; 350: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 351: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 210
	i32 2427813419, ; 352: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 287
	i32 2435356389, ; 353: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 354: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 355: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 356: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 357: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 358: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 213
	i32 2471841756, ; 359: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 360: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 361: Microsoft.Maui.Controls => 0x93dba8a1 => 188
	i32 2483903535, ; 362: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 363: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 364: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 365: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 366: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 235
	i32 2522472828, ; 367: Xamarin.Android.Glide.dll => 0x9659e17c => 194
	i32 2538310050, ; 368: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 369: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 288
	i32 2562349572, ; 370: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 371: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 372: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 236
	i32 2581819634, ; 373: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 258
	i32 2585220780, ; 374: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 375: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 376: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 377: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 297
	i32 2605712449, ; 378: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 276
	i32 2615233544, ; 379: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 227
	i32 2616218305, ; 380: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 184
	i32 2617129537, ; 381: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 382: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 383: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 217
	i32 2624644809, ; 384: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 222
	i32 2626831493, ; 385: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 292
	i32 2627185994, ; 386: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 387: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 388: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 231
	i32 2663391936, ; 389: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 196
	i32 2663698177, ; 390: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 391: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 392: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 393: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 394: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 395: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 396: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 256
	i32 2715334215, ; 397: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 398: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 399: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 400: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 401: Xamarin.AndroidX.Activity => 0xa2e0939b => 198
	i32 2735172069, ; 402: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 403: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 204
	i32 2740948882, ; 404: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 405: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 406: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 298
	i32 2758225723, ; 407: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 189
	i32 2764765095, ; 408: Microsoft.Maui.dll => 0xa4caf7a7 => 190
	i32 2765824710, ; 409: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 410: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 270
	i32 2778768386, ; 411: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 261
	i32 2779977773, ; 412: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 249
	i32 2785988530, ; 413: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 304
	i32 2788224221, ; 414: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 227
	i32 2801831435, ; 415: Microsoft.Maui.Graphics => 0xa7008e0b => 192
	i32 2803228030, ; 416: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 417: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 283
	i32 2810250172, ; 418: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 214
	i32 2819470561, ; 419: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 420: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 421: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 249
	i32 2824502124, ; 422: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 423: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 296
	i32 2838993487, ; 424: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 238
	i32 2849599387, ; 425: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 426: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 261
	i32 2855708567, ; 427: Xamarin.AndroidX.Transition => 0xaa36a797 => 257
	i32 2861098320, ; 428: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 429: Microsoft.Maui.Essentials => 0xaa8a4878 => 191
	i32 2868488919, ; 430: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 174
	i32 2870099610, ; 431: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 199
	i32 2875164099, ; 432: Jsr305Binding.dll => 0xab5f85c3 => 266
	i32 2875220617, ; 433: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 434: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 225
	i32 2887636118, ; 435: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 436: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 437: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 438: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 439: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 440: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 441: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 262
	i32 2919462931, ; 442: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 443: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 201
	i32 2936416060, ; 444: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 445: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 446: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 447: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 448: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 449: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 450: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 221
	i32 2987532451, ; 451: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 252
	i32 2996846495, ; 452: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 234
	i32 3016983068, ; 453: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 254
	i32 3023353419, ; 454: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 455: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 229
	i32 3038032645, ; 456: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 311
	i32 3056245963, ; 457: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 251
	i32 3057625584, ; 458: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 242
	i32 3059408633, ; 459: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 460: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 461: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 462: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 289
	i32 3090735792, ; 463: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 464: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 465: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 466: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 467: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 468: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 469: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 470: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 471: GoogleGson.dll => 0xbba64c02 => 177
	i32 3159123045, ; 472: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 473: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 474: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 243
	i32 3192346100, ; 475: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 476: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 477: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 478: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 479: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 220
	i32 3220365878, ; 480: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 481: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 482: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 483: Xamarin.AndroidX.CardView => 0xc235e84d => 208
	i32 3265493905, ; 484: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 485: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 486: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 487: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 488: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 489: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 490: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 491: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 492: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 284
	i32 3316684772, ; 493: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 494: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 218
	i32 3317144872, ; 495: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 496: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 206
	i32 3345895724, ; 497: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 247
	i32 3346324047, ; 498: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 244
	i32 3357674450, ; 499: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 301
	i32 3358260929, ; 500: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 501: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 199
	i32 3362522851, ; 502: Xamarin.AndroidX.Core => 0xc86c06e3 => 215
	i32 3366347497, ; 503: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 504: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 248
	i32 3381016424, ; 505: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 280
	i32 3395150330, ; 506: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 507: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 508: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 219
	i32 3428513518, ; 509: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 180
	i32 3429136800, ; 510: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 511: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 512: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 222
	i32 3445260447, ; 513: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 514: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 187
	i32 3463511458, ; 515: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 288
	i32 3471940407, ; 516: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 517: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 518: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 301
	i32 3484440000, ; 519: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 300
	i32 3485117614, ; 520: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 521: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 522: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 211
	i32 3509114376, ; 523: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 524: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 525: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 526: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 527: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 528: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 529: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 308
	i32 3597029428, ; 530: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 197
	i32 3598340787, ; 531: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 532: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 533: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 534: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 246
	i32 3633644679, ; 535: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 201
	i32 3638274909, ; 536: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 537: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 232
	i32 3643446276, ; 538: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 305
	i32 3643854240, ; 539: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 243
	i32 3645089577, ; 540: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 541: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 179
	i32 3660523487, ; 542: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 543: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 544: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 207
	i32 3684561358, ; 545: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 211
	i32 3697841164, ; 546: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 310
	i32 3700866549, ; 547: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 548: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 216
	i32 3716563718, ; 549: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 550: Xamarin.AndroidX.Annotation => 0xdda814c6 => 200
	i32 3724971120, ; 551: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 242
	i32 3732100267, ; 552: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 553: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 554: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 555: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 556: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 209
	i32 3792276235, ; 557: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 558: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 187
	i32 3802395368, ; 559: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 560: CommunityToolkit.Maui.dll => 0xe3886bf7 => 173
	i32 3819260425, ; 561: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 562: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 563: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 564: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 181
	i32 3844307129, ; 565: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 566: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 567: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 568: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 569: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 570: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 571: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 257
	i32 3888767677, ; 572: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 247
	i32 3889960447, ; 573: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 309
	i32 3896106733, ; 574: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 575: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 215
	i32 3901907137, ; 576: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 577: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 578: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 260
	i32 3928044579, ; 579: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 580: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 581: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 245
	i32 3945713374, ; 582: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 583: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 584: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 203
	i32 3959773229, ; 585: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 234
	i32 3980434154, ; 586: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 304
	i32 3987592930, ; 587: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 286
	i32 4003436829, ; 588: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 589: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 202
	i32 4024013275, ; 590: Firebase.Auth => 0xefd991db => 176
	i32 4025784931, ; 591: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 592: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 189
	i32 4054681211, ; 593: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 594: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 595: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 596: Microsoft.Maui.Essentials.dll => 0xf40add04 => 191
	i32 4099507663, ; 597: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 598: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 599: Xamarin.AndroidX.Emoji2 => 0xf479582c => 223
	i32 4102112229, ; 600: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 299
	i32 4125707920, ; 601: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 294
	i32 4126470640, ; 602: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 180
	i32 4127667938, ; 603: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 604: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 605: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 606: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 306
	i32 4151237749, ; 607: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 608: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 609: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 610: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 611: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 612: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 239
	i32 4185676441, ; 613: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 614: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 615: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 616: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 216
	i32 4258378803, ; 617: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 238
	i32 4260525087, ; 618: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 619: Microsoft.Maui.Controls.dll => 0xfea12dee => 188
	i32 4274623895, ; 620: CommunityToolkit.Mvvm.dll => 0xfec99597 => 175
	i32 4274976490, ; 621: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 622: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 239
	i32 4294763496 ; 623: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 225
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [624 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 235, ; 3
	i32 269, ; 4
	i32 48, ; 5
	i32 193, ; 6
	i32 80, ; 7
	i32 145, ; 8
	i32 30, ; 9
	i32 310, ; 10
	i32 124, ; 11
	i32 192, ; 12
	i32 102, ; 13
	i32 253, ; 14
	i32 107, ; 15
	i32 253, ; 16
	i32 139, ; 17
	i32 273, ; 18
	i32 77, ; 19
	i32 124, ; 20
	i32 13, ; 21
	i32 209, ; 22
	i32 132, ; 23
	i32 255, ; 24
	i32 151, ; 25
	i32 307, ; 26
	i32 308, ; 27
	i32 18, ; 28
	i32 207, ; 29
	i32 26, ; 30
	i32 229, ; 31
	i32 1, ; 32
	i32 59, ; 33
	i32 42, ; 34
	i32 91, ; 35
	i32 212, ; 36
	i32 147, ; 37
	i32 231, ; 38
	i32 228, ; 39
	i32 279, ; 40
	i32 54, ; 41
	i32 69, ; 42
	i32 307, ; 43
	i32 198, ; 44
	i32 83, ; 45
	i32 292, ; 46
	i32 230, ; 47
	i32 291, ; 48
	i32 131, ; 49
	i32 55, ; 50
	i32 149, ; 51
	i32 74, ; 52
	i32 145, ; 53
	i32 62, ; 54
	i32 146, ; 55
	i32 311, ; 56
	i32 165, ; 57
	i32 303, ; 58
	i32 213, ; 59
	i32 12, ; 60
	i32 226, ; 61
	i32 125, ; 62
	i32 152, ; 63
	i32 113, ; 64
	i32 166, ; 65
	i32 164, ; 66
	i32 228, ; 67
	i32 241, ; 68
	i32 84, ; 69
	i32 290, ; 70
	i32 284, ; 71
	i32 186, ; 72
	i32 150, ; 73
	i32 273, ; 74
	i32 60, ; 75
	i32 182, ; 76
	i32 51, ; 77
	i32 103, ; 78
	i32 114, ; 79
	i32 40, ; 80
	i32 266, ; 81
	i32 264, ; 82
	i32 120, ; 83
	i32 298, ; 84
	i32 0, ; 85
	i32 173, ; 86
	i32 52, ; 87
	i32 44, ; 88
	i32 119, ; 89
	i32 0, ; 90
	i32 218, ; 91
	i32 296, ; 92
	i32 224, ; 93
	i32 81, ; 94
	i32 136, ; 95
	i32 260, ; 96
	i32 205, ; 97
	i32 8, ; 98
	i32 73, ; 99
	i32 278, ; 100
	i32 155, ; 101
	i32 275, ; 102
	i32 154, ; 103
	i32 92, ; 104
	i32 270, ; 105
	i32 45, ; 106
	i32 293, ; 107
	i32 281, ; 108
	i32 274, ; 109
	i32 109, ; 110
	i32 129, ; 111
	i32 25, ; 112
	i32 195, ; 113
	i32 72, ; 114
	i32 55, ; 115
	i32 46, ; 116
	i32 302, ; 117
	i32 185, ; 118
	i32 219, ; 119
	i32 22, ; 120
	i32 233, ; 121
	i32 86, ; 122
	i32 43, ; 123
	i32 160, ; 124
	i32 71, ; 125
	i32 246, ; 126
	i32 3, ; 127
	i32 42, ; 128
	i32 63, ; 129
	i32 16, ; 130
	i32 53, ; 131
	i32 305, ; 132
	i32 269, ; 133
	i32 105, ; 134
	i32 193, ; 135
	i32 274, ; 136
	i32 267, ; 137
	i32 230, ; 138
	i32 34, ; 139
	i32 158, ; 140
	i32 85, ; 141
	i32 32, ; 142
	i32 12, ; 143
	i32 51, ; 144
	i32 56, ; 145
	i32 250, ; 146
	i32 36, ; 147
	i32 181, ; 148
	i32 280, ; 149
	i32 268, ; 150
	i32 203, ; 151
	i32 35, ; 152
	i32 58, ; 153
	i32 237, ; 154
	i32 177, ; 155
	i32 17, ; 156
	i32 271, ; 157
	i32 164, ; 158
	i32 293, ; 159
	i32 236, ; 160
	i32 184, ; 161
	i32 263, ; 162
	i32 299, ; 163
	i32 153, ; 164
	i32 259, ; 165
	i32 244, ; 166
	i32 297, ; 167
	i32 205, ; 168
	i32 29, ; 169
	i32 175, ; 170
	i32 52, ; 171
	i32 295, ; 172
	i32 264, ; 173
	i32 5, ; 174
	i32 279, ; 175
	i32 254, ; 176
	i32 258, ; 177
	i32 210, ; 178
	i32 275, ; 179
	i32 202, ; 180
	i32 221, ; 181
	i32 85, ; 182
	i32 263, ; 183
	i32 61, ; 184
	i32 112, ; 185
	i32 57, ; 186
	i32 309, ; 187
	i32 250, ; 188
	i32 99, ; 189
	i32 19, ; 190
	i32 214, ; 191
	i32 111, ; 192
	i32 101, ; 193
	i32 102, ; 194
	i32 277, ; 195
	i32 104, ; 196
	i32 267, ; 197
	i32 71, ; 198
	i32 38, ; 199
	i32 32, ; 200
	i32 103, ; 201
	i32 73, ; 202
	i32 283, ; 203
	i32 9, ; 204
	i32 123, ; 205
	i32 46, ; 206
	i32 204, ; 207
	i32 186, ; 208
	i32 9, ; 209
	i32 43, ; 210
	i32 4, ; 211
	i32 251, ; 212
	i32 287, ; 213
	i32 282, ; 214
	i32 31, ; 215
	i32 138, ; 216
	i32 92, ; 217
	i32 93, ; 218
	i32 302, ; 219
	i32 49, ; 220
	i32 141, ; 221
	i32 112, ; 222
	i32 140, ; 223
	i32 220, ; 224
	i32 115, ; 225
	i32 268, ; 226
	i32 157, ; 227
	i32 76, ; 228
	i32 79, ; 229
	i32 240, ; 230
	i32 37, ; 231
	i32 262, ; 232
	i32 174, ; 233
	i32 224, ; 234
	i32 217, ; 235
	i32 64, ; 236
	i32 138, ; 237
	i32 15, ; 238
	i32 116, ; 239
	i32 256, ; 240
	i32 265, ; 241
	i32 212, ; 242
	i32 48, ; 243
	i32 70, ; 244
	i32 80, ; 245
	i32 126, ; 246
	i32 94, ; 247
	i32 121, ; 248
	i32 272, ; 249
	i32 26, ; 250
	i32 233, ; 251
	i32 97, ; 252
	i32 28, ; 253
	i32 208, ; 254
	i32 300, ; 255
	i32 278, ; 256
	i32 149, ; 257
	i32 169, ; 258
	i32 4, ; 259
	i32 98, ; 260
	i32 33, ; 261
	i32 93, ; 262
	i32 255, ; 263
	i32 182, ; 264
	i32 21, ; 265
	i32 41, ; 266
	i32 170, ; 267
	i32 294, ; 268
	i32 226, ; 269
	i32 286, ; 270
	i32 240, ; 271
	i32 271, ; 272
	i32 265, ; 273
	i32 245, ; 274
	i32 2, ; 275
	i32 134, ; 276
	i32 111, ; 277
	i32 183, ; 278
	i32 306, ; 279
	i32 195, ; 280
	i32 303, ; 281
	i32 58, ; 282
	i32 95, ; 283
	i32 285, ; 284
	i32 39, ; 285
	i32 206, ; 286
	i32 25, ; 287
	i32 94, ; 288
	i32 89, ; 289
	i32 99, ; 290
	i32 10, ; 291
	i32 87, ; 292
	i32 100, ; 293
	i32 252, ; 294
	i32 178, ; 295
	i32 272, ; 296
	i32 197, ; 297
	i32 282, ; 298
	i32 7, ; 299
	i32 237, ; 300
	i32 277, ; 301
	i32 194, ; 302
	i32 88, ; 303
	i32 232, ; 304
	i32 154, ; 305
	i32 281, ; 306
	i32 33, ; 307
	i32 116, ; 308
	i32 82, ; 309
	i32 20, ; 310
	i32 11, ; 311
	i32 162, ; 312
	i32 3, ; 313
	i32 190, ; 314
	i32 289, ; 315
	i32 185, ; 316
	i32 183, ; 317
	i32 84, ; 318
	i32 276, ; 319
	i32 64, ; 320
	i32 291, ; 321
	i32 176, ; 322
	i32 259, ; 323
	i32 143, ; 324
	i32 241, ; 325
	i32 157, ; 326
	i32 41, ; 327
	i32 117, ; 328
	i32 179, ; 329
	i32 196, ; 330
	i32 285, ; 331
	i32 248, ; 332
	i32 131, ; 333
	i32 75, ; 334
	i32 66, ; 335
	i32 295, ; 336
	i32 172, ; 337
	i32 200, ; 338
	i32 143, ; 339
	i32 106, ; 340
	i32 151, ; 341
	i32 70, ; 342
	i32 156, ; 343
	i32 178, ; 344
	i32 121, ; 345
	i32 127, ; 346
	i32 290, ; 347
	i32 152, ; 348
	i32 223, ; 349
	i32 141, ; 350
	i32 210, ; 351
	i32 287, ; 352
	i32 20, ; 353
	i32 14, ; 354
	i32 135, ; 355
	i32 75, ; 356
	i32 59, ; 357
	i32 213, ; 358
	i32 167, ; 359
	i32 168, ; 360
	i32 188, ; 361
	i32 15, ; 362
	i32 74, ; 363
	i32 6, ; 364
	i32 23, ; 365
	i32 235, ; 366
	i32 194, ; 367
	i32 91, ; 368
	i32 288, ; 369
	i32 1, ; 370
	i32 136, ; 371
	i32 236, ; 372
	i32 258, ; 373
	i32 134, ; 374
	i32 69, ; 375
	i32 146, ; 376
	i32 297, ; 377
	i32 276, ; 378
	i32 227, ; 379
	i32 184, ; 380
	i32 88, ; 381
	i32 96, ; 382
	i32 217, ; 383
	i32 222, ; 384
	i32 292, ; 385
	i32 31, ; 386
	i32 45, ; 387
	i32 231, ; 388
	i32 196, ; 389
	i32 109, ; 390
	i32 158, ; 391
	i32 35, ; 392
	i32 22, ; 393
	i32 114, ; 394
	i32 57, ; 395
	i32 256, ; 396
	i32 144, ; 397
	i32 118, ; 398
	i32 120, ; 399
	i32 110, ; 400
	i32 198, ; 401
	i32 139, ; 402
	i32 204, ; 403
	i32 54, ; 404
	i32 105, ; 405
	i32 298, ; 406
	i32 189, ; 407
	i32 190, ; 408
	i32 133, ; 409
	i32 270, ; 410
	i32 261, ; 411
	i32 249, ; 412
	i32 304, ; 413
	i32 227, ; 414
	i32 192, ; 415
	i32 159, ; 416
	i32 283, ; 417
	i32 214, ; 418
	i32 163, ; 419
	i32 132, ; 420
	i32 249, ; 421
	i32 161, ; 422
	i32 296, ; 423
	i32 238, ; 424
	i32 140, ; 425
	i32 261, ; 426
	i32 257, ; 427
	i32 169, ; 428
	i32 191, ; 429
	i32 174, ; 430
	i32 199, ; 431
	i32 266, ; 432
	i32 40, ; 433
	i32 225, ; 434
	i32 81, ; 435
	i32 56, ; 436
	i32 37, ; 437
	i32 97, ; 438
	i32 166, ; 439
	i32 172, ; 440
	i32 262, ; 441
	i32 82, ; 442
	i32 201, ; 443
	i32 98, ; 444
	i32 30, ; 445
	i32 159, ; 446
	i32 18, ; 447
	i32 127, ; 448
	i32 119, ; 449
	i32 221, ; 450
	i32 252, ; 451
	i32 234, ; 452
	i32 254, ; 453
	i32 165, ; 454
	i32 229, ; 455
	i32 311, ; 456
	i32 251, ; 457
	i32 242, ; 458
	i32 170, ; 459
	i32 16, ; 460
	i32 144, ; 461
	i32 289, ; 462
	i32 125, ; 463
	i32 118, ; 464
	i32 38, ; 465
	i32 115, ; 466
	i32 47, ; 467
	i32 142, ; 468
	i32 117, ; 469
	i32 34, ; 470
	i32 177, ; 471
	i32 95, ; 472
	i32 53, ; 473
	i32 243, ; 474
	i32 129, ; 475
	i32 153, ; 476
	i32 24, ; 477
	i32 161, ; 478
	i32 220, ; 479
	i32 148, ; 480
	i32 104, ; 481
	i32 89, ; 482
	i32 208, ; 483
	i32 60, ; 484
	i32 142, ; 485
	i32 100, ; 486
	i32 5, ; 487
	i32 13, ; 488
	i32 122, ; 489
	i32 135, ; 490
	i32 28, ; 491
	i32 284, ; 492
	i32 72, ; 493
	i32 218, ; 494
	i32 24, ; 495
	i32 206, ; 496
	i32 247, ; 497
	i32 244, ; 498
	i32 301, ; 499
	i32 137, ; 500
	i32 199, ; 501
	i32 215, ; 502
	i32 168, ; 503
	i32 248, ; 504
	i32 280, ; 505
	i32 101, ; 506
	i32 123, ; 507
	i32 219, ; 508
	i32 180, ; 509
	i32 163, ; 510
	i32 167, ; 511
	i32 222, ; 512
	i32 39, ; 513
	i32 187, ; 514
	i32 288, ; 515
	i32 17, ; 516
	i32 171, ; 517
	i32 301, ; 518
	i32 300, ; 519
	i32 137, ; 520
	i32 150, ; 521
	i32 211, ; 522
	i32 155, ; 523
	i32 130, ; 524
	i32 19, ; 525
	i32 65, ; 526
	i32 147, ; 527
	i32 47, ; 528
	i32 308, ; 529
	i32 197, ; 530
	i32 79, ; 531
	i32 61, ; 532
	i32 106, ; 533
	i32 246, ; 534
	i32 201, ; 535
	i32 49, ; 536
	i32 232, ; 537
	i32 305, ; 538
	i32 243, ; 539
	i32 14, ; 540
	i32 179, ; 541
	i32 68, ; 542
	i32 171, ; 543
	i32 207, ; 544
	i32 211, ; 545
	i32 310, ; 546
	i32 78, ; 547
	i32 216, ; 548
	i32 108, ; 549
	i32 200, ; 550
	i32 242, ; 551
	i32 67, ; 552
	i32 63, ; 553
	i32 27, ; 554
	i32 160, ; 555
	i32 209, ; 556
	i32 10, ; 557
	i32 187, ; 558
	i32 11, ; 559
	i32 173, ; 560
	i32 78, ; 561
	i32 126, ; 562
	i32 83, ; 563
	i32 181, ; 564
	i32 66, ; 565
	i32 107, ; 566
	i32 65, ; 567
	i32 128, ; 568
	i32 122, ; 569
	i32 77, ; 570
	i32 257, ; 571
	i32 247, ; 572
	i32 309, ; 573
	i32 8, ; 574
	i32 215, ; 575
	i32 2, ; 576
	i32 44, ; 577
	i32 260, ; 578
	i32 156, ; 579
	i32 128, ; 580
	i32 245, ; 581
	i32 23, ; 582
	i32 133, ; 583
	i32 203, ; 584
	i32 234, ; 585
	i32 304, ; 586
	i32 286, ; 587
	i32 29, ; 588
	i32 202, ; 589
	i32 176, ; 590
	i32 62, ; 591
	i32 189, ; 592
	i32 90, ; 593
	i32 87, ; 594
	i32 148, ; 595
	i32 191, ; 596
	i32 36, ; 597
	i32 86, ; 598
	i32 223, ; 599
	i32 299, ; 600
	i32 294, ; 601
	i32 180, ; 602
	i32 50, ; 603
	i32 6, ; 604
	i32 90, ; 605
	i32 306, ; 606
	i32 21, ; 607
	i32 162, ; 608
	i32 96, ; 609
	i32 50, ; 610
	i32 113, ; 611
	i32 239, ; 612
	i32 130, ; 613
	i32 76, ; 614
	i32 27, ; 615
	i32 216, ; 616
	i32 238, ; 617
	i32 7, ; 618
	i32 188, ; 619
	i32 175, ; 620
	i32 110, ; 621
	i32 239, ; 622
	i32 225 ; 623
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
