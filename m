Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8151A96F
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 22:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D736D89A9B;
	Sat, 11 May 2019 20:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 565EC89A8B
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 20:38:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4B18F721CD; Sat, 11 May 2019 20:38:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110214] radeonsi: xterm scrollback buffer disappears while
 Shift+PgUp and Shift+PgDn
Date: Sat, 11 May 2019 20:38:41 +0000
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
Message-ID: <bug-110214-502-XOqqhis4gy@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1590353419=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1590353419==
Content-Type: multipart/alternative; boundary="15576071210.542Bab.4968"
Content-Transfer-Encoding: 7bit


--15576071210.542Bab.4968
Date: Sat, 11 May 2019 20:38:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110214

--- Comment #92 from Diego Viola <diego.viola@gmail.com> ---
(In reply to komqinxit from comment #91)
> xfce4-terminal and Geany bugs seem to be this
> https://bugs.freedesktop.org/show_bug.cgi?id=3D110355 and solved with mesa
> 19.0.4.

That's good to know, thanks.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15576071210.542Bab.4968
Date: Sat, 11 May 2019 20:38:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110214#c92">Comme=
nt # 92</a>
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
        <pre>(In reply to komqinxit from <a href=3D"show_bug.cgi?id=3D11021=
4#c91">comment #91</a>)
<span class=3D"quote">&gt; xfce4-terminal and Geany bugs seem to be this
&gt; <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - radeonsi: GTK elements become invisible in som=
e applications (GIMP, LibreOffice)"
   href=3D"show_bug.cgi?id=3D110355">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110355</a> and solved with mesa
&gt; 19.0.4.</span >

That's good to know, thanks.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15576071210.542Bab.4968--

--===============1590353419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1590353419==--
