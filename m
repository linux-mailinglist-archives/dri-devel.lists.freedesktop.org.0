Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6940242DA3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 19:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383E88972C;
	Wed, 12 Jun 2019 17:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3543B8972C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 17:40:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 318E472167; Wed, 12 Jun 2019 17:40:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 99970] DRI3 steam login window is empty
Date: Wed, 12 Jun 2019 17:40:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cosiekvfj@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-99970-502-drx1a9Rsso@http.bugs.freedesktop.org/>
In-Reply-To: <bug-99970-502@http.bugs.freedesktop.org/>
References: <bug-99970-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0568391947=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0568391947==
Content-Type: multipart/alternative; boundary="15603612561.Ab6f7.7000"
Content-Transfer-Encoding: 7bit


--15603612561.Ab6f7.7000
Date: Wed, 12 Jun 2019 17:40:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99970

--- Comment #7 from cosiekvfj@o2.pl ---
>You can try glamor, but I'm not sure it can work with your GPU.

Yea I think it can't /var/log/Xorg.0.log
>glamor requires at least 128 instructions (64 reported)

Is is worth to try to fix DRI3 and EXA for this driver or is it better to s=
tick
to DRI2?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603612561.Ab6f7.7000
Date: Wed, 12 Jun 2019 17:40:56 +0000
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
   title=3D"NEW - DRI3 steam login window is empty"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99970#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRI3 steam login window is empty"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99970">bug 99970<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cosiekvfj&#64;o2.pl" title=3D"cosiekvfj&#64;o2.pl">cosiekvfj&#64;o2.pl</a>
</span></b>
        <pre><span class=3D"quote">&gt;You can try glamor, but I'm not sure=
 it can work with your GPU.</span >

Yea I think it can't /var/log/Xorg.0.log
<span class=3D"quote">&gt;glamor requires at least 128 instructions (64 rep=
orted)</span >

Is is worth to try to fix DRI3 and EXA for this driver or is it better to s=
tick
to DRI2?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603612561.Ab6f7.7000--

--===============0568391947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0568391947==--
