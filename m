Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A34BE428
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 20:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520BF6EC3E;
	Wed, 25 Sep 2019 18:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 75CF36EC63
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 18:02:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 72DAB72162; Wed, 25 Sep 2019 18:02:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 104604] [amdgpu/radeon][regression, CIK] Prefetch the compute
 shader to TC L2 (4a4ff66dbe) causes GPU VM errors when running OpenCL kernels
 on Hawaii
Date: Wed, 25 Sep 2019 18:02:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 17.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: gitlab-migration@fdo.invalid
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-104604-502-HLtSF0RIkP@http.bugs.freedesktop.org/>
In-Reply-To: <bug-104604-502@http.bugs.freedesktop.org/>
References: <bug-104604-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1971113354=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1971113354==
Content-Type: multipart/alternative; boundary="15694345481.81f3bEAd.734"
Content-Transfer-Encoding: 7bit


--15694345481.81f3bEAd.734
Date: Wed, 25 Sep 2019 18:02:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104604

GitLab Migration User <gitlab-migration@fdo.invalid> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |MOVED

--- Comment #1 from GitLab Migration User <gitlab-migration@fdo.invalid> ---
-- GitLab Migration Automatic Message --

This bug has been migrated to freedesktop.org's GitLab instance and has been
closed from further activity.

You can subscribe and participate further through the new bug through this =
link
to our GitLab instance: https://gitlab.freedesktop.org/mesa/mesa/issues/130=
0.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15694345481.81f3bEAd.734
Date: Wed, 25 Sep 2019 18:02:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:gitlab-mi=
gration&#64;fdo.invalid" title=3D"GitLab Migration User &lt;gitlab-migratio=
n&#64;fdo.invalid&gt;"> <span class=3D"fn">GitLab Migration User</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - [amdgpu/radeon][regression, CIK] Prefetch the =
compute shader to TC L2 (4a4ff66dbe) causes GPU VM errors when running Open=
CL kernels on Hawaii"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104604">bug 10460=
4</a>
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
   title=3D"RESOLVED MOVED - [amdgpu/radeon][regression, CIK] Prefetch the =
compute shader to TC L2 (4a4ff66dbe) causes GPU VM errors when running Open=
CL kernels on Hawaii"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104604#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - [amdgpu/radeon][regression, CIK] Prefetch the =
compute shader to TC L2 (4a4ff66dbe) causes GPU VM errors when running Open=
CL kernels on Hawaii"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104604">bug 10460=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gitlab-migration&#64;fdo.invalid" title=3D"GitLab Migration User &lt;gitlab=
-migration&#64;fdo.invalid&gt;"> <span class=3D"fn">GitLab Migration User</=
span></a>
</span></b>
        <pre>-- GitLab Migration Automatic Message --

This bug has been migrated to freedesktop.org's GitLab instance and has been
closed from further activity.

You can subscribe and participate further through the new bug through this =
link
to our GitLab instance: <a href=3D"https://gitlab.freedesktop.org/mesa/mesa=
/issues/1300">https://gitlab.freedesktop.org/mesa/mesa/issues/1300</a>.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15694345481.81f3bEAd.734--

--===============1971113354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1971113354==--
