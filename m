Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6ED2BC49
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 00:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EE189A74;
	Mon, 27 May 2019 22:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 116B189A74
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 22:58:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 04DBE72167; Mon, 27 May 2019 22:58:47 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110711] American Truck Simulator shows strange colored
 reflections
Date: Mon, 27 May 2019 22:58:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110711-502-LNwe2OvVVB@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110711-502@http.bugs.freedesktop.org/>
References: <bug-110711-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0294571838=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0294571838==
Content-Type: multipart/alternative; boundary="15589979260.51A82dd.24578"
Content-Transfer-Encoding: 7bit


--15589979260.51A82dd.24578
Date: Mon, 27 May 2019 22:58:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110711

--- Comment #3 from Timothy Arceri <t_arceri@yahoo.com.au> ---
(In reply to Petr Sebor from comment #2)
> Whoops, this one got unnoticed (unreported?) for quite some time it seems.
> However, the game is still evolving and the rendering code improving over
> the years. If there is a performance overhead tied together to zeroing VR=
AM,
> I'd rather fix the game. I can do that. Please do not add workarounds if
> that is going to hurt the game performance.

Performance shouldn't be impacted too much be we would much rather not have
these workarounds. I've pushed the workaround to master for now but if you =
fix
it please report it here and I've revert the change. Thanks.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15589979260.51A82dd.24578
Date: Mon, 27 May 2019 22:58:46 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - American Truck Simulator shows strange colored refle=
ctions"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110711#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - American Truck Simulator shows strange colored refle=
ctions"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110711">bug 11071=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>(In reply to Petr Sebor from <a href=3D"show_bug.cgi?id=3D1107=
11#c2">comment #2</a>)
<span class=3D"quote">&gt; Whoops, this one got unnoticed (unreported?) for=
 quite some time it seems.
&gt; However, the game is still evolving and the rendering code improving o=
ver
&gt; the years. If there is a performance overhead tied together to zeroing=
 VRAM,
&gt; I'd rather fix the game. I can do that. Please do not add workarounds =
if
&gt; that is going to hurt the game performance.</span >

Performance shouldn't be impacted too much be we would much rather not have
these workarounds. I've pushed the workaround to master for now but if you =
fix
it please report it here and I've revert the change. Thanks.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15589979260.51A82dd.24578--

--===============0294571838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0294571838==--
