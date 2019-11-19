Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D29101B61
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA416EC4F;
	Tue, 19 Nov 2019 08:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 828D56EC54
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:10:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7F16E720E2; Tue, 19 Nov 2019 08:10:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 98276] Kernel Panic on shutdown caused by "drm/amdgpu: always
 apply pci shutdown callbacks"
Date: Tue, 19 Nov 2019 08:10:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: martin.peres@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-98276-502-tc7YCnRw0I@http.bugs.freedesktop.org/>
In-Reply-To: <bug-98276-502@http.bugs.freedesktop.org/>
References: <bug-98276-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1831060932=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1831060932==
Content-Type: multipart/alternative; boundary="15741510443.26Bcaa7.9876"
Content-Transfer-Encoding: 7bit


--15741510443.26Bcaa7.9876
Date: Tue, 19 Nov 2019 08:10:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98276

Martin Peres <martin.peres@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |MOVED

--- Comment #14 from Martin Peres <martin.peres@free.fr> ---
-- GitLab Migration Automatic Message --

This bug has been migrated to freedesktop.org's GitLab instance and has been
closed from further activity.

You can subscribe and participate further through the new bug through this =
link
to our GitLab instance: https://gitlab.freedesktop.org/drm/amd/issues/106.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15741510443.26Bcaa7.9876
Date: Tue, 19 Nov 2019 08:10:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:martin.pe=
res&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <=
span class=3D"fn">Martin Peres</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - Kernel Panic on shutdown caused by &quot;drm/a=
mdgpu: always apply pci shutdown callbacks&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98276">bug 98276<=
/a>
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
           <td>MOVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - Kernel Panic on shutdown caused by &quot;drm/a=
mdgpu: always apply pci shutdown callbacks&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98276#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - Kernel Panic on shutdown caused by &quot;drm/a=
mdgpu: always apply pci shutdown callbacks&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98276">bug 98276<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>-- GitLab Migration Automatic Message --

This bug has been migrated to freedesktop.org's GitLab instance and has been
closed from further activity.

You can subscribe and participate further through the new bug through this =
link
to our GitLab instance: <a href=3D"https://gitlab.freedesktop.org/drm/amd/i=
ssues/106">https://gitlab.freedesktop.org/drm/amd/issues/106</a>.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15741510443.26Bcaa7.9876--

--===============1831060932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1831060932==--
