Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C151877D4C
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2019 05:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB176E8AF;
	Sun, 28 Jul 2019 03:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 539266E8AF
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 03:07:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 49AAC72167; Sun, 28 Jul 2019 03:07:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110813] Vega hang on Surviving Mars game
Date: Sun, 28 Jul 2019 03:07:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stalkerg@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110813-502-ZFJmrKMfLr@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110813-502@http.bugs.freedesktop.org/>
References: <bug-110813-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1348853925=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1348853925==
Content-Type: multipart/alternative; boundary="15642832510.f0AbACFE.6633"
Content-Transfer-Encoding: 7bit


--15642832510.f0AbACFE.6633
Date: Sun, 28 Jul 2019 03:07:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110813

--- Comment #4 from Yury Zhuravlev <stalkerg@gmail.com> ---
but still, exist but close to
https://bugs.freedesktop.org/show_bug.cgi?id=3D102322 now.=20
If I remove FPS limit in-game and mesa it's working stable.=20
Problems somewhere in power management and if card needs to change freq clo=
ck
too often.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642832510.f0AbACFE.6633
Date: Sun, 28 Jul 2019 03:07:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Vega hang on Surviving Mars game"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110813#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Vega hang on Surviving Mars game"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110813">bug 11081=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stalkerg&#64;gmail.com" title=3D"Yury Zhuravlev &lt;stalkerg&#64;gmail.com&=
gt;"> <span class=3D"fn">Yury Zhuravlev</span></a>
</span></b>
        <pre>but still, exist but close to
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"show_bug.cgi?id=3D102322">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D102322</a> now.=20
If I remove FPS limit in-game and mesa it's working stable.=20
Problems somewhere in power management and if card needs to change freq clo=
ck
too often.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642832510.f0AbACFE.6633--

--===============1348853925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1348853925==--
