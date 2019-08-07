Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BA985187
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 18:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EEB6E73F;
	Wed,  7 Aug 2019 16:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92D3B6E73F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 16:57:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8F2D072167; Wed,  7 Aug 2019 16:57:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109524] "Invalid glsl version in shading_language_version()"
 when trying to run directX games using wine
Date: Wed, 07 Aug 2019 16:57:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/R100
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jasuarez@igalia.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109524-502-rscLpCD1I2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109524-502@http.bugs.freedesktop.org/>
References: <bug-109524-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0395635901=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0395635901==
Content-Type: multipart/alternative; boundary="15651970312.4fdd2A637.24953"
Content-Transfer-Encoding: 7bit


--15651970312.4fdd2A637.24953
Date: Wed, 7 Aug 2019 16:57:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109524

--- Comment #14 from Juan A. Suarez <jasuarez@igalia.com> ---
(In reply to Juan A. Suarez from comment #13)
> The patch landed in Mesa 19.1.5.

I meant 19.1.4. Sorry.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15651970312.4fdd2A637.24953
Date: Wed, 7 Aug 2019 16:57:11 +0000
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
   title=3D"RESOLVED FIXED - &quot;Invalid glsl version in shading_language=
_version()&quot; when trying to run directX games using wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109524#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - &quot;Invalid glsl version in shading_language=
_version()&quot; when trying to run directX games using wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109524">bug 10952=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jasuarez&#64;igalia.com" title=3D"Juan A. Suarez &lt;jasuarez&#64;igalia.co=
m&gt;"> <span class=3D"fn">Juan A. Suarez</span></a>
</span></b>
        <pre>(In reply to Juan A. Suarez from <a href=3D"show_bug.cgi?id=3D=
109524#c13">comment #13</a>)
<span class=3D"quote">&gt; The patch landed in Mesa 19.1.5.</span >

I meant 19.1.4. Sorry.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15651970312.4fdd2A637.24953--

--===============0395635901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0395635901==--
