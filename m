Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B7B6B66
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 21:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26766F8D2;
	Wed, 18 Sep 2019 19:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D87F86F8DC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 19:00:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D2C3672167; Wed, 18 Sep 2019 19:00:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 54877] [bisected] rendering corrupted for windows larger than
 2048 pixels in one dimension
Date: Wed, 18 Sep 2019 19:00:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r600
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gitlab-migration@fdo.invalid
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-54877-502-jFy1l0XRQn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-54877-502@http.bugs.freedesktop.org/>
References: <bug-54877-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1323055385=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1323055385==
Content-Type: multipart/alternative; boundary="15688332503.a54Ac.19390"
Content-Transfer-Encoding: 7bit


--15688332503.a54Ac.19390
Date: Wed, 18 Sep 2019 19:00:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D54877

GitLab Migration User <gitlab-migration@fdo.invalid> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |MOVED

--- Comment #5 from GitLab Migration User <gitlab-migration@fdo.invalid> ---
-- GitLab Migration Automatic Message --

This bug has been migrated to freedesktop.org's GitLab instance and has been
closed from further activity.

You can subscribe and participate further through the new bug through this =
link
to our GitLab instance: https://gitlab.freedesktop.org/mesa/mesa/issues/418.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15688332503.a54Ac.19390
Date: Wed, 18 Sep 2019 19:00:50 +0000
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
   title=3D"RESOLVED MOVED - [bisected] rendering corrupted for windows lar=
ger than 2048 pixels in one dimension"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D54877">bug 54877<=
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
   title=3D"RESOLVED MOVED - [bisected] rendering corrupted for windows lar=
ger than 2048 pixels in one dimension"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D54877#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - [bisected] rendering corrupted for windows lar=
ger than 2048 pixels in one dimension"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D54877">bug 54877<=
/a>
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
/issues/418">https://gitlab.freedesktop.org/mesa/mesa/issues/418</a>.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15688332503.a54Ac.19390--

--===============1323055385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1323055385==--
