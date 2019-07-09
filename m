Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CB663240
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8176A6E04E;
	Tue,  9 Jul 2019 07:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A02F6E061
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 07:38:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 46F0372167; Tue,  9 Jul 2019 07:38:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102322] System crashes after "[drm] IP block:gmc_v8_0 is hung!"
 / [drm] IP block:sdma_v3_0 is hung!
Date: Tue, 09 Jul 2019 07:38:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: me@jasondaigo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102322-502-fpwg2L6gEh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102322-502@http.bugs.freedesktop.org/>
References: <bug-102322-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1080029124=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1080029124==
Content-Type: multipart/alternative; boundary="15626579063.B7921ae9.30285"
Content-Transfer-Encoding: 7bit


--15626579063.B7921ae9.30285
Date: Tue, 9 Jul 2019 07:38:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102322

--- Comment #84 from Wilko Bartels <me@jasondaigo.de> ---
(In reply to Wilko Bartels from comment #83)
> (In reply to Jaap Buurman from comment #81)
> > issue seems to be using a setup that requires higher engine clocks in i=
dle
> > AFAIK. Either high refresh displays, or in my case, multiple monitors. =
Could
> > this be part of the issue that seems to trigger this bug? I might be
> > grasping at straws here, but I have had this problem for as long as I h=
ave
> > this Vega64 (bought at launch), while it is 100% stable under Windows 1=
0 in
> > the same setup.
>=20
> This might be true. I was running i3 with xrandr set to 144hz when the
> freeze scenario began (somewhat last mont, did not "game" much before). T=
han
> switched to icewm to test and issue was gone. Later when i configured ice=
wm
> to also have proper xrandr setting issue comes back. I didnt know that co=
uld
> be related. Will test this tonight.

nevermind. it crashed on 60hz as well (once) yesterday

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15626579063.B7921ae9.30285
Date: Tue, 9 Jul 2019 07:38:26 +0000
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
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322#c84">Comme=
nt # 84</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322">bug 10232=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;jasondaigo.de" title=3D"Wilko Bartels &lt;me&#64;jasondaigo.de&gt;">=
 <span class=3D"fn">Wilko Bartels</span></a>
</span></b>
        <pre>(In reply to Wilko Bartels from <a href=3D"show_bug.cgi?id=3D1=
02322#c83">comment #83</a>)
<span class=3D"quote">&gt; (In reply to Jaap Buurman from <a href=3D"show_b=
ug.cgi?id=3D102322#c81">comment #81</a>)
&gt; &gt; issue seems to be using a setup that requires higher engine clock=
s in idle
&gt; &gt; AFAIK. Either high refresh displays, or in my case, multiple moni=
tors. Could
&gt; &gt; this be part of the issue that seems to trigger this bug? I might=
 be
&gt; &gt; grasping at straws here, but I have had this problem for as long =
as I have
&gt; &gt; this Vega64 (bought at launch), while it is 100% stable under Win=
dows 10 in
&gt; &gt; the same setup.
&gt;=20
&gt; This might be true. I was running i3 with xrandr set to 144hz when the
&gt; freeze scenario began (somewhat last mont, did not &quot;game&quot; mu=
ch before). Than
&gt; switched to icewm to test and issue was gone. Later when i configured =
icewm
&gt; to also have proper xrandr setting issue comes back. I didnt know that=
 could
&gt; be related. Will test this tonight.</span >

nevermind. it crashed on 60hz as well (once) yesterday</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15626579063.B7921ae9.30285--

--===============1080029124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1080029124==--
