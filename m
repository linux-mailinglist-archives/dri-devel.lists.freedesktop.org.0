Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A45CBD9C8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 10:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE862897E8;
	Wed, 25 Sep 2019 08:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E52DB897E8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 08:26:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E175E72162; Wed, 25 Sep 2019 08:26:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111808] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout cause process into Disk sleep state
Date: Wed, 25 Sep 2019 08:26:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: a9016009@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-111808-502-BXbWHP72hR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111808-502@http.bugs.freedesktop.org/>
References: <bug-111808-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1627944501=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1627944501==
Content-Type: multipart/alternative; boundary="15693999812.f080.18388"
Content-Transfer-Encoding: 7bit


--15693999812.f080.18388
Date: Wed, 25 Sep 2019 08:26:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111808

Andre Klapper <a9016009@gmx.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #1 from Andre Klapper <a9016009@gmx.de> ---


*** This bug has been marked as a duplicate of bug 111807 ***

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15693999812.f080.18388
Date: Wed, 25 Sep 2019 08:26:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:a9016009&=
#64;gmx.de" title=3D"Andre Klapper &lt;a9016009&#64;gmx.de&gt;"> <span clas=
s=3D"fn">Andre Klapper</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - [drm:amdgpu_job_timedout [amdgpu]] *ERROR*=
 ring gfx timeout cause process into Disk sleep state"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111808">bug 11180=
8</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>DUPLICATE
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - [drm:amdgpu_job_timedout [amdgpu]] *ERROR*=
 ring gfx timeout cause process into Disk sleep state"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111808#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - [drm:amdgpu_job_timedout [amdgpu]] *ERROR*=
 ring gfx timeout cause process into Disk sleep state"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111808">bug 11180=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
a9016009&#64;gmx.de" title=3D"Andre Klapper &lt;a9016009&#64;gmx.de&gt;"> <=
span class=3D"fn">Andre Klapper</span></a>
</span></b>
        <pre>

*** This bug has been marked as a duplicate of <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut cause process into Disk sleep state"
   href=3D"show_bug.cgi?id=3D111807">bug 111807</a> ***</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15693999812.f080.18388--

--===============1627944501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1627944501==--
