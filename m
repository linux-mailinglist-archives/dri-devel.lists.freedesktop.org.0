Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298BD61E49
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 14:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258D289BB2;
	Mon,  8 Jul 2019 12:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F2A989BB2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 12:20:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 934A572167; Mon,  8 Jul 2019 12:20:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111087] SteamOS fails to boot with "drmmode_do_crtc_dpms cannot
 get last vblank counter"
Date: Mon, 08 Jul 2019 12:20:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ludovico.denittis@collabora.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111087-502-xLgJPkf3G2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111087-502@http.bugs.freedesktop.org/>
References: <bug-111087-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1083035358=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1083035358==
Content-Type: multipart/alternative; boundary="15625884490.Fdf4529.23475"
Content-Transfer-Encoding: 7bit


--15625884490.Fdf4529.23475
Date: Mon, 8 Jul 2019 12:20:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111087

--- Comment #1 from Ludovico de Nittis <ludovico.denittis@collabora.com> ---
Created attachment 144720
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144720&action=3Dedit
Xorg.0.log

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15625884490.Fdf4529.23475
Date: Mon, 8 Jul 2019 12:20:49 +0000
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
   title=3D"NEW - SteamOS fails to boot with &quot;drmmode_do_crtc_dpms can=
not get last vblank counter&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111087#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - SteamOS fails to boot with &quot;drmmode_do_crtc_dpms can=
not get last vblank counter&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111087">bug 11108=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ludovico.denittis&#64;collabora.com" title=3D"Ludovico de Nittis &lt;ludovi=
co.denittis&#64;collabora.com&gt;"> <span class=3D"fn">Ludovico de Nittis</=
span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144720=
" name=3D"attach_144720" title=3D"Xorg.0.log">attachment 144720</a> <a href=
=3D"attachment.cgi?id=3D144720&amp;action=3Dedit" title=3D"Xorg.0.log">[det=
ails]</a></span>
Xorg.0.log</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15625884490.Fdf4529.23475--

--===============1083035358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1083035358==--
