Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF69A681FB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 03:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2A689804;
	Mon, 15 Jul 2019 01:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED96F89804
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 01:00:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E4E6172167; Mon, 15 Jul 2019 01:00:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110214] radeonsi: xterm scrollback buffer disappears while
 Shift+PgUp and Shift+PgDn
Date: Mon, 15 Jul 2019 01:00:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: diego.viola@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110214-502-hIOv2hSlUW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110214-502@http.bugs.freedesktop.org/>
References: <bug-110214-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1341644643=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1341644643==
Content-Type: multipart/alternative; boundary="15631524570.6b89ECB.18257"
Content-Transfer-Encoding: 7bit


--15631524570.6b89ECB.18257
Date: Mon, 15 Jul 2019 01:00:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110214

--- Comment #98 from Diego Viola <diego.viola@gmail.com> ---
(In reply to Diego Viola from comment #96)
> Created attachment 144786 [details]
> Yet another workaround (patch) for xterm
>=20
> Replacing FontHeight for VDrawable seems to help.

VDrawable is just a big number, so same thing as Comment 86.

Nevermind.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15631524570.6b89ECB.18257
Date: Mon, 15 Jul 2019 01:00:57 +0000
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
   title=3D"NEW - radeonsi: xterm scrollback buffer disappears while Shift+=
PgUp and Shift+PgDn"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110214#c98">Comme=
nt # 98</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - radeonsi: xterm scrollback buffer disappears while Shift+=
PgUp and Shift+PgDn"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110214">bug 11021=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
diego.viola&#64;gmail.com" title=3D"Diego Viola &lt;diego.viola&#64;gmail.c=
om&gt;"> <span class=3D"fn">Diego Viola</span></a>
</span></b>
        <pre>(In reply to Diego Viola from <a href=3D"show_bug.cgi?id=3D110=
214#c96">comment #96</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D144786" name=3D"attach_144786" title=3D"Yet another workaround (pat=
ch) for xterm">attachment 144786</a> <a href=3D"attachment.cgi?id=3D144786&=
amp;action=3Dedit" title=3D"Yet another workaround (patch) for xterm">[deta=
ils]</a></span>
&gt; Yet another workaround (patch) for xterm
&gt;=20
&gt; Replacing FontHeight for VDrawable seems to help.</span >

VDrawable is just a big number, so same thing as <a href=3D"show_bug.cgi?id=
=3D110214#c86">Comment 86</a>.

Nevermind.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15631524570.6b89ECB.18257--

--===============1341644643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1341644643==--
