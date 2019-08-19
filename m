Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C3892237
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 13:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E8A6E119;
	Mon, 19 Aug 2019 11:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 38A1D6E115
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 11:25:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 35B9C72161; Mon, 19 Aug 2019 11:25:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102646] Screen flickering under amdgpu-experimental [buggy auto
 power profile]
Date: Mon, 19 Aug 2019 11:25:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: magist3r@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102646-502-bJgjXwvLLR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102646-502@http.bugs.freedesktop.org/>
References: <bug-102646-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0704632921=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0704632921==
Content-Type: multipart/alternative; boundary="15662139052.965E4.25668"
Content-Transfer-Encoding: 7bit


--15662139052.965E4.25668
Date: Mon, 19 Aug 2019 11:25:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102646

--- Comment #111 from magist3r <magist3r@gmail.com> ---
(In reply to tempel.julian from comment #110)
> (In reply to magist3r from comment #109)
> > My patch fixes a bug that breaks this behavior when OverDrive mask is
> > enabled, nothing more.
>=20
> It unfortunately also forces my single display 1440p 75Hz into maximum VR=
AM
> clock.

It's not caused by my patch. Try to disable overdrive mask, revert the patch
and you will see the same behavior.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15662139052.965E4.25668
Date: Mon, 19 Aug 2019 11:25:05 +0000
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
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646#c111">Comm=
ent # 111</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646">bug 10264=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
magist3r&#64;gmail.com" title=3D"magist3r &lt;magist3r&#64;gmail.com&gt;"> =
<span class=3D"fn">magist3r</span></a>
</span></b>
        <pre>(In reply to tempel.julian from <a href=3D"show_bug.cgi?id=3D1=
02646#c110">comment #110</a>)
<span class=3D"quote">&gt; (In reply to magist3r from <a href=3D"show_bug.c=
gi?id=3D102646#c109">comment #109</a>)
&gt; &gt; My patch fixes a bug that breaks this behavior when OverDrive mas=
k is
&gt; &gt; enabled, nothing more.
&gt;=20
&gt; It unfortunately also forces my single display 1440p 75Hz into maximum=
 VRAM
&gt; clock.</span >

It's not caused by my patch. Try to disable overdrive mask, revert the patch
and you will see the same behavior.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15662139052.965E4.25668--

--===============0704632921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0704632921==--
