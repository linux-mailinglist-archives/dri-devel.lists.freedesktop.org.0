Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1886415E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 08:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3386B89568;
	Wed, 10 Jul 2019 06:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B05E89919
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 06:29:33 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 57B5272167; Wed, 10 Jul 2019 06:29:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 10 Jul 2019 06:29:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jasondaigo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-KibQ6HhrB0@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1159746395=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1159746395==
Content-Type: multipart/alternative; boundary="15627401735.7b33FFe3.28898"
Content-Transfer-Encoding: 7bit


--15627401735.7b33FFe3.28898
Date: Wed, 10 Jul 2019 06:29:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #42 from Wilko Bartels <me@jasondaigo.de> ---
(In reply to Wilko Bartels from comment #40)
> Since i experience the same issue since june (didnt game much) i want to
> share my system info.
> I am on Ryzen 2600X, Vega 56 Pulse, Strix B450. Using Arch 5.1.
> Tested every Windowmanager i know , tested also 60Hz and 144Hz. The crash=
es
> are totally random. I only play Dota 2. Last friday i played like 6 games=
 in
> a row without a single issue. The day after i crashed like 7 times per ga=
me.
> Always have to press reset on my PC.=20
> Is it know that hits issue related to a kernel or mesa update? I mean it
> wasnt always like this no?

tested yesterday with the new 5.2 linux kernel from arch testing, and also
tested without variable refreshrate setting and without tearfree setting in
Xorg. crashed three times.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15627401735.7b33FFe3.28898
Date: Wed, 10 Jul 2019 06:29:33 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c42">Comme=
nt # 42</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;jasondaigo.de" title=3D"Wilko Bartels &lt;me&#64;jasondaigo.de&gt;">=
 <span class=3D"fn">Wilko Bartels</span></a>
</span></b>
        <pre>(In reply to Wilko Bartels from <a href=3D"show_bug.cgi?id=3D1=
09955#c40">comment #40</a>)
<span class=3D"quote">&gt; Since i experience the same issue since june (di=
dnt game much) i want to
&gt; share my system info.
&gt; I am on Ryzen 2600X, Vega 56 Pulse, Strix B450. Using Arch 5.1.
&gt; Tested every Windowmanager i know , tested also 60Hz and 144Hz. The cr=
ashes
&gt; are totally random. I only play Dota 2. Last friday i played like 6 ga=
mes in
&gt; a row without a single issue. The day after i crashed like 7 times per=
 game.
&gt; Always have to press reset on my PC.=20
&gt; Is it know that hits issue related to a kernel or mesa update? I mean =
it
&gt; wasnt always like this no?</span >

tested yesterday with the new 5.2 linux kernel from arch testing, and also
tested without variable refreshrate setting and without tearfree setting in
Xorg. crashed three times.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15627401735.7b33FFe3.28898--

--===============1159746395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1159746395==--
