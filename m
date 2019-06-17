Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF724811E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 13:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FFD891BA;
	Mon, 17 Jun 2019 11:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFB27891BA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 11:43:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C7EF072167; Mon, 17 Jun 2019 11:43:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110883] [Regression linux 5.2-rc4][bisected] hang on boot
Date: Mon, 17 Jun 2019 11:44:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: freedesktop@sibrenvasse.nl
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-110883-502-iAqwA33NDO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110883-502@http.bugs.freedesktop.org/>
References: <bug-110883-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2031739386=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2031739386==
Content-Type: multipart/alternative; boundary="15607718390.6eb285.13054"
Content-Transfer-Encoding: 7bit


--15607718390.6eb285.13054
Date: Mon, 17 Jun 2019 11:43:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110883

Sibren Vasse <freedesktop@sibrenvasse.nl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #10 from Sibren Vasse <freedesktop@sibrenvasse.nl> ---
Commit is included in 5.2-rc5. Issue no longer present.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Df3a5231c8f14acd42845e9e60f506b4e948f0e68

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15607718390.6eb285.13054
Date: Mon, 17 Jun 2019 11:43:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:freedeskt=
op&#64;sibrenvasse.nl" title=3D"Sibren Vasse &lt;freedesktop&#64;sibrenvass=
e.nl&gt;"> <span class=3D"fn">Sibren Vasse</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [Regression linux 5.2-rc4][bisected] hang on b=
oot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110883">bug 11088=
3</a>
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
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [Regression linux 5.2-rc4][bisected] hang on b=
oot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110883#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [Regression linux 5.2-rc4][bisected] hang on b=
oot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110883">bug 11088=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;sibrenvasse.nl" title=3D"Sibren Vasse &lt;freedesktop&#64;s=
ibrenvasse.nl&gt;"> <span class=3D"fn">Sibren Vasse</span></a>
</span></b>
        <pre>Commit is included in 5.2-rc5. Issue no longer present.

<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3Df3a5231c8f14acd42845e9e60f506b4e948f0e68">https://git.kerne=
l.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Df3a5231c8f14=
acd42845e9e60f506b4e948f0e68</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15607718390.6eb285.13054--

--===============2031739386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2031739386==--
