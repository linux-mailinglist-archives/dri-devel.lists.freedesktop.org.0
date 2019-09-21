Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA9BA268
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70EB89DA8;
	Sun, 22 Sep 2019 12:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF4BE6E0CA
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 17:29:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CBBF172162; Sat, 21 Sep 2019 17:29:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109246] HDMI connected monitors fail to sleep and instead turn
 back on when amdgpu.dc=1
Date: Sat, 21 Sep 2019 17:29:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ariannebrink@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109246-502-e8pRYhlaLZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109246-502@http.bugs.freedesktop.org/>
References: <bug-109246-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0403280648=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0403280648==
Content-Type: multipart/alternative; boundary="15690869673.cEb5.1475"
Content-Transfer-Encoding: 7bit


--15690869673.cEb5.1475
Date: Sat, 21 Sep 2019 17:29:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109246

--- Comment #29 from Arianne Brink <ariannebrink@posteo.de> ---
My Vega 56 is showing the same problems. However, I noticed that by disabli=
ng
xfsettingsd in XFCE and kscreen in Plasma it solved the problem. It will
suspend my monitors properly using dpms force off.  I3WM and other window
managers don't show the same problem either, this seems to be related to
desktop environments and the way they manage displays.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15690869673.cEb5.1475
Date: Sat, 21 Sep 2019 17:29:27 +0000
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
   title=3D"NEW - HDMI connected monitors fail to sleep and instead turn ba=
ck on when amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109246#c29">Comme=
nt # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HDMI connected monitors fail to sleep and instead turn ba=
ck on when amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109246">bug 10924=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ariannebrink&#64;posteo.de" title=3D"Arianne Brink &lt;ariannebrink&#64;pos=
teo.de&gt;"> <span class=3D"fn">Arianne Brink</span></a>
</span></b>
        <pre>My Vega 56 is showing the same problems. However, I noticed th=
at by disabling
xfsettingsd in XFCE and kscreen in Plasma it solved the problem. It will
suspend my monitors properly using dpms force off.  I3WM and other window
managers don't show the same problem either, this seems to be related to
desktop environments and the way they manage displays.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15690869673.cEb5.1475--

--===============0403280648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0403280648==--
