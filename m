Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82EC2682C
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 18:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB56889BFC;
	Wed, 22 May 2019 16:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E015B89BFC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 16:26:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DD13672167; Wed, 22 May 2019 16:26:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110721] graphics corruption on steam client with mesa 19.1.0
 rc3 on polaris
Date: Wed, 22 May 2019 16:26:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edisonalvarez@arnet.com.ar
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110721-502-rs1JkcNiRq@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110721-502@http.bugs.freedesktop.org/>
References: <bug-110721-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2004545860=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2004545860==
Content-Type: multipart/alternative; boundary="15585423711.F16760d.32081"
Content-Transfer-Encoding: 7bit


--15585423711.F16760d.32081
Date: Wed, 22 May 2019 16:26:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110721

--- Comment #7 from alvarex <edisonalvarez@arnet.com.ar> ---
(In reply to Ropid from comment #6)
> @alvarex:
>=20
> Try starting chromium with this command line here, it makes it show
> corruption everywhere for me here:
>=20
> chromium --ignore-gpu-blacklist --enable-gpu-rasterization
> --enable-native-gpu-memory-buffers --enable-zero-copy
> --disable-gpu-driver-bug-workarounds
>=20
> About Visual Studio Code, I see corruption when I click on the main menu =
and
> move the mouse around to open and close the different menus there.

no the bug doesn't trigger with chromium unless this error has something to=
 do
maybe chrome is not detecting the gpu (same as steam)

> ac: Unknown GPU, using 0 for raster_config
> [1:7:0522/132124.876161:ERROR:command_buffer_proxy_impl.cc(125)]=20
> ContextResult::kTransientFailure: Failed to send=20
> GpuChannelMsg_CreateCommandBuffer.
> [31337:31346:0522/132131.668335:ERROR:browser_process_sub_thread.cc(217)]=
=20
> Waited 322 ms for network service



@Ropid
what version of chromium are u using??

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15585423711.F16760d.32081
Date: Wed, 22 May 2019 16:26:11 +0000
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
   title=3D"NEW - graphics corruption on steam client with mesa 19.1.0 rc3 =
on polaris"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110721#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - graphics corruption on steam client with mesa 19.1.0 rc3 =
on polaris"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110721">bug 11072=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
edisonalvarez&#64;arnet.com.ar" title=3D"alvarex &lt;edisonalvarez&#64;arne=
t.com.ar&gt;"> <span class=3D"fn">alvarex</span></a>
</span></b>
        <pre>(In reply to Ropid from <a href=3D"show_bug.cgi?id=3D110721#c6=
">comment #6</a>)
<span class=3D"quote">&gt; &#64;alvarex:
&gt;=20
&gt; Try starting chromium with this command line here, it makes it show
&gt; corruption everywhere for me here:
&gt;=20
&gt; chromium --ignore-gpu-blacklist --enable-gpu-rasterization
&gt; --enable-native-gpu-memory-buffers --enable-zero-copy
&gt; --disable-gpu-driver-bug-workarounds
&gt;=20
&gt; About Visual Studio Code, I see corruption when I click on the main me=
nu and
&gt; move the mouse around to open and close the different menus there.</sp=
an >

no the bug doesn't trigger with chromium unless this error has something to=
 do
maybe chrome is not detecting the gpu (same as steam)

<span class=3D"quote">&gt; ac: Unknown GPU, using 0 for raster_config
&gt; [1:7:0522/132124.876161:ERROR:command_buffer_proxy_impl.cc(125)]=20
&gt; ContextResult::kTransientFailure: Failed to send=20
&gt; GpuChannelMsg_CreateCommandBuffer.
&gt; [31337:31346:0522/132131.668335:ERROR:browser_process_sub_thread.cc(21=
7)]=20
&gt; Waited 322 ms for network service</span >



&#64;Ropid
what version of chromium are u using??</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15585423711.F16760d.32081--

--===============2004545860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2004545860==--
