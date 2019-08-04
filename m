Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDC980B38
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 16:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F24D89E01;
	Sun,  4 Aug 2019 14:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3569F89DFD
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 14:18:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 31C4F72168; Sun,  4 Aug 2019 14:18:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sun, 04 Aug 2019 14:18:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sylvain.bertrand@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-TPMrwXhEZj@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1568592800=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1568592800==
Content-Type: multipart/alternative; boundary="15649283362.727AE.3103"
Content-Transfer-Encoding: 7bit


--15649283362.727AE.3103
Date: Sun, 4 Aug 2019 14:18:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #77 from Sylvain BERTRAND <sylvain.bertrand@gmail.com> ---
On Sun, Aug 04, 2019 at 05:05:52AM +0000, bugzilla-daemon@freedesktop.org
wrote:
> By the way, Interesting to see that even my ubuntu budgie LTS with valve
> mesa-aco and different kernel, has the same warning.
> [    5.739656] amdgpu 0000:0a:00.0: Direct firmware load for
> amdgpu/vega20_ta.bin failed with error -2
> [    5.739659] amdgpu 0000:0a:00.0: psp v11.0: Failed to load firmware
> "amdgpu/vega20_ta.bin"

I don't know of an AMD GPU part able to run without properly loaded firmwar=
e.

That would have to be confirmed by official AMD devs which are the sole ppl
with that knowledge.

In the very probable case that the firmware _must_ be loaded for proper gpu
operations, you have to tell the maintainers of the distros you use to upda=
te
their linux/amdgpu firmware package.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15649283362.727AE.3103
Date: Sun, 4 Aug 2019 14:18:56 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c77">Comme=
nt # 77</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sylvain.bertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertr=
and&#64;gmail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span></b>
        <pre>On Sun, Aug 04, 2019 at 05:05:52AM +0000, <a href=3D"mailto:bu=
gzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>
wrote:
<span class=3D"quote">&gt; By the way, Interesting to see that even my ubun=
tu budgie LTS with valve
&gt; mesa-aco and different kernel, has the same warning.
&gt; [    5.739656] amdgpu 0000:0a:00.0: Direct firmware load for
&gt; amdgpu/vega20_ta.bin failed with error -2
&gt; [    5.739659] amdgpu 0000:0a:00.0: psp v11.0: Failed to load firmware
&gt; &quot;amdgpu/vega20_ta.bin&quot;</span >

I don't know of an AMD GPU part able to run without properly loaded firmwar=
e.

That would have to be confirmed by official AMD devs which are the sole ppl
with that knowledge.

In the very probable case that the firmware _must_ be loaded for proper gpu
operations, you have to tell the maintainers of the distros you use to upda=
te
their linux/amdgpu firmware package.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15649283362.727AE.3103--

--===============1568592800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1568592800==--
