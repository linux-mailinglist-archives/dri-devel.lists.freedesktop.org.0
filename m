Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4823776E55
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 17:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2C36EDB0;
	Fri, 26 Jul 2019 15:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A5056EDB0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 15:56:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5151872167; Fri, 26 Jul 2019 15:56:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109073] AMDGPU Radeon RX540 system freezes and/or crashes; poor
 performance with ac adapter plugged in
Date: Fri, 26 Jul 2019 15:56:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: proje.pdf@outlook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WORKSFORME
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-109073-502-Lkplf5Wwh8@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109073-502@http.bugs.freedesktop.org/>
References: <bug-109073-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1930580875=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1930580875==
Content-Type: multipart/alternative; boundary="15641566160.9657.10813"
Content-Transfer-Encoding: 7bit


--15641566160.9657.10813
Date: Fri, 26 Jul 2019 15:56:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109073

Utku Helvac=C4=B1 (tuxutku) <proje.pdf@outlook.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #14 from Utku Helvac=C4=B1 (tuxutku) <proje.pdf@outlook.com> ---
Issue has been gone!
As of 5.3.0-050300rc1-generic #201907212232 the issue is have been gone.
i have downloaded and installed the kernel via mainline kernel update utili=
ty
on Pop_OS!
tested both vulkan and opengl.
https://bugzilla.kernel.org/show_bug.cgi?id=3D201077#c37

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15641566160.9657.10813
Date: Fri, 26 Jul 2019 15:56:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:proje.pdf=
&#64;outlook.com" title=3D"Utku Helvac=C4=B1 (tuxutku) &lt;proje.pdf&#64;ou=
tlook.com&gt;"> <span class=3D"fn">Utku Helvac=C4=B1 (tuxutku)</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - AMDGPU Radeon RX540 system freezes and/or=
 crashes; poor performance with ac adapter plugged in"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109073">bug 10907=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>WORKSFORME
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - AMDGPU Radeon RX540 system freezes and/or=
 crashes; poor performance with ac adapter plugged in"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109073#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - AMDGPU Radeon RX540 system freezes and/or=
 crashes; poor performance with ac adapter plugged in"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109073">bug 10907=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
proje.pdf&#64;outlook.com" title=3D"Utku Helvac=C4=B1 (tuxutku) &lt;proje.p=
df&#64;outlook.com&gt;"> <span class=3D"fn">Utku Helvac=C4=B1 (tuxutku)</sp=
an></a>
</span></b>
        <pre>Issue has been gone!
As of 5.3.0-050300rc1-generic #201907212232 the issue is have been gone.
i have downloaded and installed the kernel via mainline kernel update utili=
ty
on Pop_OS!
tested both vulkan and opengl.
<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D201077#c37">https:=
//bugzilla.kernel.org/show_bug.cgi?id=3D201077#c37</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15641566160.9657.10813--

--===============1930580875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1930580875==--
