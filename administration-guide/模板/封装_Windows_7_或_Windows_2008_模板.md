# 封装 Windows 7 或 Windows 2008 模板
**概述**</br>
在使用 Windows 7 或 Windows 2008 模板创建虚拟机前，需要封装它。

1. 在作为模板使用的虚拟机上，打开一个命令行终端，并输入 regedit.

2. Registry Editor 窗口会被打开。在左面的框中，展开 HKEY_LOCAL_MACHINE → SYSTEM → SETUP。

3. 在主窗口中，点鼠标右键，使用 New → String Value 来添加一个新的字符串。

4. 点鼠标右键，选择修改打开编辑字符串窗口。

5. 输入以下信息：

   - Value name: UnattendFile
   </br></br>
   - Value data: a:\sysprep.inf
  </br></br>
6. 通过 C:\Windows\System32\sysprep\sysprep.exe 运行 Sysprep。

7. 在 Sysprep 中输入以下信息：

   -  在 System Cleanup Action 下，选择 Enter System Out-of-Box-Experience (OOBE)。</br></br>
   - 如需修改系统的 ID（SID），选择 Generalize。</br></br>
   - 在 Shutdown Options 下，选择 Shutdown。
</br></br>
点 OK 完成封装的过程，在封装完成后，虚拟机会被自动关闭。

**结果**</br>
Windows 7 或 Windows 2008 模板被封装，并可以被用来创建虚拟机。
