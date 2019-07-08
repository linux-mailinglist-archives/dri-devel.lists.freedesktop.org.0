Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95779626C6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 19:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6210589E38;
	Mon,  8 Jul 2019 17:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F9D989E9B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 17:00:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EBB7B72168; Mon,  8 Jul 2019 17:00:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111082] Severe stutter in CS:GO surf servers, despite ~300fps
Date: Mon, 08 Jul 2019 17:00:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sylvain.bertrand@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111082-502-dPI6pAlQHL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111082-502@http.bugs.freedesktop.org/>
References: <bug-111082-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0253608826=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0253608826==
Content-Type: multipart/alternative; boundary="15626052490.9A2eBA.30024"
Content-Transfer-Encoding: 7bit


--15626052490.9A2eBA.30024
Date: Mon, 8 Jul 2019 17:00:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111082

--- Comment #5 from Sylvain BERTRAND <sylvain.bertrand@gmail.com> ---
I did report my CSGO performance pb to valve devs:
https://github.com/ValveSoftware/csgo-osx-linux/issues/1111

I have no idea if my CPU bound performance pb is in the driver (which is ve=
ry
likely since it's opengl), or the 3D engine.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15626052490.9A2eBA.30024
Date: Mon, 8 Jul 2019 17:00:49 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Severe stutter in CS:GO surf servers, despite =
~300fps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111082#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Severe stutter in CS:GO surf servers, despite =
~300fps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111082">bug 11108=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sylvain.bertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertr=
and&#64;gmail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span></b>
        <pre>I did report my CSGO performance pb to valve devs:
<a href=3D"https://github.com/ValveSoftware/csgo-osx-linux/issues/1111">htt=
ps://github.com/ValveSoftware/csgo-osx-linux/issues/1111</a>

I have no idea if my CPU bound performance pb is in the driver (which is ve=
ry
likely since it's opengl), or the 3D engine.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15626052490.9A2eBA.30024--

--===============0253608826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0253608826==--
