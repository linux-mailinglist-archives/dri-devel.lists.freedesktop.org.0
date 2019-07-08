Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3AC61C94
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 11:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568E289BBD;
	Mon,  8 Jul 2019 09:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 11F9789BBD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 09:50:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0EF7172168; Mon,  8 Jul 2019 09:50:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111082] Severe stutter in CS:GO surf servers, despite ~300fps
Date: Mon, 08 Jul 2019 09:50:43 +0000
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
Message-ID: <bug-111082-502-871OOUeI5c@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1585537026=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1585537026==
Content-Type: multipart/alternative; boundary="15625794430.bBfC298Ce.28904"
Content-Transfer-Encoding: 7bit


--15625794430.bBfC298Ce.28904
Date: Mon, 8 Jul 2019 09:50:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111082

--- Comment #3 from Sylvain BERTRAND <sylvain.bertrand@gmail.com> ---
On Mon, Jul 08, 2019 at 03:20:44AM +0000, bugzilla-daemon@freedesktop.org
wrote:
> How is this not a graphics driver bug?

He meant it could be a game engine bug (network or 3D, very probably).

You are both right.

CSGO 3D engine on based linux OSes is really bad if you use maps which are =
not
in the competitive set.

For instance, danger zone open maps, on my system, have disastrous
performance... and it is CPU related, not GPU, even though I have 8 core at
4.7Ghz (something is really wrong or litteraly CPU capped somewhere).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15625794430.bBfC298Ce.28904
Date: Mon, 8 Jul 2019 09:50:43 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111082#c3">Commen=
t # 3</a>
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
        <pre>On Mon, Jul 08, 2019 at 03:20:44AM +0000, <a href=3D"mailto:bu=
gzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>
wrote:
<span class=3D"quote">&gt; How is this not a graphics driver bug?</span >

He meant it could be a game engine bug (network or 3D, very probably).

You are both right.

CSGO 3D engine on based linux OSes is really bad if you use maps which are =
not
in the competitive set.

For instance, danger zone open maps, on my system, have disastrous
performance... and it is CPU related, not GPU, even though I have 8 core at
4.7Ghz (something is really wrong or litteraly CPU capped somewhere).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15625794430.bBfC298Ce.28904--

--===============1585537026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1585537026==--
