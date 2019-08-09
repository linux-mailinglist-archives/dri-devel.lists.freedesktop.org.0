Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDC4875C6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 11:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BEC6EDD4;
	Fri,  9 Aug 2019 09:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BB7B6EDCA
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 09:21:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EE0E872167; Fri,  9 Aug 2019 09:21:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111248] Navi10 Font rendering issue in Overwatch
Date: Fri, 09 Aug 2019 09:21:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Vulkan/radeon
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.mcnutt@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: mesa-dev@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: qa_contact assigned_to component
Message-ID: <bug-111248-502-SGPm7l2nep@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111248-502@http.bugs.freedesktop.org/>
References: <bug-111248-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0595018459=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0595018459==
Content-Type: multipart/alternative; boundary="15653424880.05CFaD.16024"
Content-Transfer-Encoding: 7bit


--15653424880.05CFaD.16024
Date: Fri, 9 Aug 2019 09:21:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111248

Matt <m.mcnutt@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|dri-devel@lists.freedesktop |mesa-dev@lists.freedesktop.
                   |.org                        |org
           Assignee|dri-devel@lists.freedesktop |mesa-dev@lists.freedesktop.
                   |.org                        |org
          Component|Drivers/Gallium/radeonsi    |Drivers/Vulkan/radeon

--- Comment #2 from Matt <m.mcnutt@gmail.com> ---
Moving this to Vulkan / RADV bug

Loading the game up under the latest amdvlk from 26/7 renders the fonts
correctly (albeit with artefacts that are inherent to that build at the mom=
ent
on Navi10). It seems I was mistaken under my initial testing, the game fail=
s to
render at all under wined3d.

Mesa: 19.2 git 39a90749
LLVM: 10.0 git git4575679
Kernel: 5.2.3 with DRM-NEXT patchset

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15653424880.05CFaD.16024
Date: Fri, 9 Aug 2019 09:21:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:m.mcnutt&=
#64;gmail.com" title=3D"Matt &lt;m.mcnutt&#64;gmail.com&gt;"> <span class=
=3D"fn">Matt</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Navi10 Font rendering issue in Overwatch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111248">bug 11124=
8</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Drivers/Gallium/radeonsi
           </td>
           <td>Drivers/Vulkan/radeon
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Navi10 Font rendering issue in Overwatch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111248#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Navi10 Font rendering issue in Overwatch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111248">bug 11124=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
m.mcnutt&#64;gmail.com" title=3D"Matt &lt;m.mcnutt&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Matt</span></a>
</span></b>
        <pre>Moving this to Vulkan / RADV bug

Loading the game up under the latest amdvlk from 26/7 renders the fonts
correctly (albeit with artefacts that are inherent to that build at the mom=
ent
on Navi10). It seems I was mistaken under my initial testing, the game fail=
s to
render at all under wined3d.

Mesa: 19.2 git 39a90749
LLVM: 10.0 git git4575679
Kernel: 5.2.3 with DRM-NEXT patchset</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15653424880.05CFaD.16024--

--===============0595018459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0595018459==--
