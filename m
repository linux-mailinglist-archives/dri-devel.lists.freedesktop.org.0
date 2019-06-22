Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E04F696
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 17:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC646E21D;
	Sat, 22 Jun 2019 15:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 057E288E41
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 15:41:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F01E272167; Sat, 22 Jun 2019 15:41:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110956] List of 19.20-812932 release mistakes
Date: Sat, 22 Jun 2019 15:41:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fdo-bugs@engestrom.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: dependson
Message-ID: <bug-110956-502-bMqirvjlnf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110956-502@http.bugs.freedesktop.org/>
References: <bug-110956-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1968074451=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1968074451==
Content-Type: multipart/alternative; boundary="15612181040.AE4ECAc.14304"
Content-Transfer-Encoding: 7bit


--15612181040.AE4ECAc.14304
Date: Sat, 22 Jun 2019 15:41:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110956

Eric Engestrom <fdo-bugs@engestrom.ch> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Depends on|                            |110957, 110958, 110959,
                   |                            |110960, 110961, 110962,
                   |                            |110963, 110964, 110965,
                   |                            |110966, 110967, 110968

--- Comment #3 from Eric Engestrom <fdo-bugs@engestrom.ch> ---
I added the bugs you created in the dependency list for this one so that it
tracks the overall progress.

That said, from a quick overview those are all Ubuntu packaging issues, whi=
ch
means you need to talk to Ubuntu about these, we can't do anything about it.

I'll close the ones that are clearly something the Ubuntu packager needs to=
 do
as INVALID; I hope you don't take it badly, this was just the wrong bug tra=
cker
;)

BTW, when possible you should try to make a proper Arch package instead of
taking what someone built for Ubuntu and extracting it on Arch.
There are things like file paths that change depending on the distro and mi=
ght
get built into the file, so your method might lead to spurious failures.


Referenced Bugs:

https://bugs.freedesktop.org/show_bug.cgi?id=3D110957
[Bug 110957] wsa-amdgpu package has empty copyright file
https://bugs.freedesktop.org/show_bug.cgi?id=3D110958
[Bug 110958] Mentioning 32 bit OS support in Release page
https://bugs.freedesktop.org/show_bug.cgi?id=3D110959
[Bug 110959] Broken link to Homepage of some packages
https://bugs.freedesktop.org/show_bug.cgi?id=3D110960
[Bug 110960] Non-existent alternative dependencies in some deb packages
https://bugs.freedesktop.org/show_bug.cgi?id=3D110961
[Bug 110961] Are provoded libdrm packages completely open source?
https://bugs.freedesktop.org/show_bug.cgi?id=3D110962
[Bug 110962] Wrong dependencies cause force dependency on amdgpu-dkms
https://bugs.freedesktop.org/show_bug.cgi?id=3D110963
[Bug 110963] Wrong condition and wrong variable substitution in
libgl1-amdgpu-mesa-dri in postinst script
https://bugs.freedesktop.org/show_bug.cgi?id=3D110964
[Bug 110964] Documentation update about provided Open Vulkan implementation
https://bugs.freedesktop.org/show_bug.cgi?id=3D110965
[Bug 110965] Documentation update about not provided PX package
https://bugs.freedesktop.org/show_bug.cgi?id=3D110966
[Bug 110966] Documentation update about required lunar sdk
https://bugs.freedesktop.org/show_bug.cgi?id=3D110967
[Bug 110967] Naming packages with pro suffix depending if open or close sou=
rce
https://bugs.freedesktop.org/show_bug.cgi?id=3D110968
[Bug 110968] Allow ubuntu users to install on other ubuntu versions
--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15612181040.AE4ECAc.14304
Date: Sat, 22 Jun 2019 15:41:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:fdo-bugs&=
#64;engestrom.ch" title=3D"Eric Engestrom &lt;fdo-bugs&#64;engestrom.ch&gt;=
"> <span class=3D"fn">Eric Engestrom</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - List of 19.20-812932 release mistakes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110956">bug 11095=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Depends on</td>
           <td>
               &nbsp;
           </td>
           <td>110957, 110958, 110959, 110960, 110961, 110962, 110963, 1109=
64, 110965, 110966, 110967, 110968
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - List of 19.20-812932 release mistakes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110956#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - List of 19.20-812932 release mistakes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110956">bug 11095=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fdo-bugs&#64;engestrom.ch" title=3D"Eric Engestrom &lt;fdo-bugs&#64;engestr=
om.ch&gt;"> <span class=3D"fn">Eric Engestrom</span></a>
</span></b>
        <pre>I added the bugs you created in the dependency list for this o=
ne so that it
tracks the overall progress.

That said, from a quick overview those are all Ubuntu packaging issues, whi=
ch
means you need to talk to Ubuntu about these, we can't do anything about it.

I'll close the ones that are clearly something the Ubuntu packager needs to=
 do
as INVALID; I hope you don't take it badly, this was just the wrong bug tra=
cker
;)

BTW, when possible you should try to make a proper Arch package instead of
taking what someone built for Ubuntu and extracting it on Arch.
There are things like file paths that change depending on the distro and mi=
ght
get built into the file, so your method might lead to spurious failures.</p=
re>
        </div>
      </p>

        <div id=3D"referenced">
          <hr style=3D"border: 1px dashed #969696">
          <b>Referenced Bugs:</b>
          <ul>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - wsa-amdgpu package has empty copyright file"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110957">Bug 11095=
7</a>] wsa-amdgpu package has empty copyright file
              </li>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mentioning 32 bit OS support in Release page"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110958">Bug 11095=
8</a>] Mentioning 32 bit OS support in Release page
              </li>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Broken link to Homepage of some packages"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110959">Bug 11095=
9</a>] Broken link to Homepage of some packages
              </li>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Non-existent alternative dependencies in some deb package=
s"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110960">Bug 11096=
0</a>] Non-existent alternative dependencies in some deb packages
              </li>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Are provoded libdrm packages completely open source?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110961">Bug 11096=
1</a>] Are provoded libdrm packages completely open source?
              </li>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Wrong dependencies cause force dependency on amdgpu-dkms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110962">Bug 11096=
2</a>] Wrong dependencies cause force dependency on amdgpu-dkms
              </li>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Wrong condition and wrong variable substitution in libgl1=
-amdgpu-mesa-dri in postinst script"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110963">Bug 11096=
3</a>] Wrong condition and wrong variable substitution in libgl1-amdgpu-mes=
a-dri in postinst script
              </li>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Documentation update about provided Open Vulkan implement=
ation"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110964">Bug 11096=
4</a>] Documentation update about provided Open Vulkan implementation
              </li>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Documentation update about not provided PX package"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110965">Bug 11096=
5</a>] Documentation update about not provided PX package
              </li>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Documentation update about required lunar sdk"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110966">Bug 11096=
6</a>] Documentation update about required lunar sdk
              </li>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Naming packages with pro suffix depending if open or clos=
e source"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110967">Bug 11096=
7</a>] Naming packages with pro suffix depending if open or close source
              </li>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Allow ubuntu users to install on other ubuntu versions"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110968">Bug 11096=
8</a>] Allow ubuntu users to install on other ubuntu versions
              </li>
          </ul>
        </div>
        <br>

      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15612181040.AE4ECAc.14304--

--===============1968074451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1968074451==--
