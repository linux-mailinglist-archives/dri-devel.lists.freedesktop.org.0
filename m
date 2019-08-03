Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DA880779
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 19:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72536E095;
	Sat,  3 Aug 2019 17:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D00A6E2CF
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 17:43:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 397D372167; Sat,  3 Aug 2019 17:43:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 03 Aug 2019 17:43:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-ddb9XJAc0l@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0144541758=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0144541758==
Content-Type: multipart/alternative; boundary="15648541813.e0cEE2e.5243"
Content-Transfer-Encoding: 7bit


--15648541813.e0cEE2e.5243
Date: Sat, 3 Aug 2019 17:43:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #74 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to Sylvain BERTRAND from comment #73)
> On Sat, Aug 03, 2019 at 01:35:55PM +0000, bugzilla-daemon@freedesktop.org
> wrote:
> > [    5.759204] amdgpu 0000:0a:00.0: Direct firmware load for
> > amdgpu/vega20_ta.bin failed with error -2
> > [    5.759205] amdgpu 0000:0a:00.0: psp v11.0: Failed to load firmware
> > "amdgpu/vega20_ta.bin"
>=20
> Did you get the latest and "greatest" amdgpu firmware package?

This is a fresh install I made to test this issue, so for now I only instal=
led
the packages per openSUSE wiki: https://en.opensuse.org/SDB:AMDGPU

I have done a snapper btrfs snapshot therefore if there is anything you wan=
t me
to test, I am ready.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15648541813.e0cEE2e.5243
Date: Sat, 3 Aug 2019 17:43:01 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c74">Comme=
nt # 74</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to Sylvain BERTRAND from <a href=3D"show_bug.cgi?id=
=3D109955#c73">comment #73</a>)
<span class=3D"quote">&gt; On Sat, Aug 03, 2019 at 01:35:55PM +0000, <a hre=
f=3D"mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freede=
sktop.org</a>
&gt; wrote:
&gt; &gt; [    5.759204] amdgpu 0000:0a:00.0: Direct firmware load for
&gt; &gt; amdgpu/vega20_ta.bin failed with error -2
&gt; &gt; [    5.759205] amdgpu 0000:0a:00.0: psp v11.0: Failed to load fir=
mware
&gt; &gt; &quot;amdgpu/vega20_ta.bin&quot;
&gt;=20
&gt; Did you get the latest and &quot;greatest&quot; amdgpu firmware packag=
e?</span >

This is a fresh install I made to test this issue, so for now I only instal=
led
the packages per openSUSE wiki: <a href=3D"https://en.opensuse.org/SDB:AMDG=
PU">https://en.opensuse.org/SDB:AMDGPU</a>

I have done a snapper btrfs snapshot therefore if there is anything you wan=
t me
to test, I am ready.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15648541813.e0cEE2e.5243--

--===============0144541758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0144541758==--
