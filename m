Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C68A3775AE
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 03:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF1E6EE7A;
	Sat, 27 Jul 2019 01:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC0D96EE7A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 01:43:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DF7B472167; Sat, 27 Jul 2019 01:43:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111228] PRIME output screen satys black on 1002:15d8 with 128MB
 VRAM
Date: Sat, 27 Jul 2019 01:43:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hhfeuer@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111228-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1033673400=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1033673400==
Content-Type: multipart/alternative; boundary="15641918180.48524b5a.13821"
Content-Transfer-Encoding: 7bit


--15641918180.48524b5a.13821
Date: Sat, 27 Jul 2019 01:43:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111228

            Bug ID: 111228
           Summary: PRIME output screen satys black on 1002:15d8 with
                    128MB VRAM
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: hhfeuer@gmx.de

So far I met the same PCI ID 1002:15d8 with 2GB VRAM which was working fine=
 in
prime output mode with any nvidia gpu as provider. The mentioned version wi=
th
128MB VRAM doesn't work. No error messages regarding prime, just the screen
staying black.
https://devtalk.nvidia.com/default/topic/1056652/linux/amd-ryzen-7-geforce-=
gtx-1660-ti-laptop-gt-cannot-get-nvidia-to-be-used-as-primary-graphics/1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15641918180.48524b5a.13821
Date: Sat, 27 Jul 2019 01:43:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - PRIME output screen satys black on 1002:15d8 with 128MB V=
RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111228">111228</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>PRIME output screen satys black on 1002:15d8 with 128MB VRAM
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>hhfeuer&#64;gmx.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>So far I met the same PCI ID 1002:15d8 with 2GB VRAM which was=
 working fine in
prime output mode with any nvidia gpu as provider. The mentioned version wi=
th
128MB VRAM doesn't work. No error messages regarding prime, just the screen
staying black.
<a href=3D"https://devtalk.nvidia.com/default/topic/1056652/linux/amd-ryzen=
-7-geforce-gtx-1660-ti-laptop-gt-cannot-get-nvidia-to-be-used-as-primary-gr=
aphics/1">https://devtalk.nvidia.com/default/topic/1056652/linux/amd-ryzen-=
7-geforce-gtx-1660-ti-laptop-gt-cannot-get-nvidia-to-be-used-as-primary-gra=
phics/1</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15641918180.48524b5a.13821--

--===============1033673400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1033673400==--
