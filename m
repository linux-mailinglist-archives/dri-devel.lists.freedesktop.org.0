Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE0CFBB0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 15:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10286E7B5;
	Tue,  8 Oct 2019 13:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44B726E7B5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 13:56:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4204972162; Tue,  8 Oct 2019 13:56:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111913] AMD Navi10 GPU powerplay issues when using two
 DisplayPort connectors
Date: Tue, 08 Oct 2019 13:56:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: venemo@msn.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111913-502-AxKFoTDHXS@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111913-502@http.bugs.freedesktop.org/>
References: <bug-111913-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0966049248=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0966049248==
Content-Type: multipart/alternative; boundary="15705430171.dB91bAe.28749"
Content-Transfer-Encoding: 7bit


--15705430171.dB91bAe.28749
Date: Tue, 8 Oct 2019 13:56:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111913

--- Comment #7 from Timur Krist=C3=B3f <venemo@msn.com> ---
(In reply to Andrew Sheldon from comment #5)
> Are both monitors 60hz? I've seen this occur with 2x60hz setups, but not
> with other combinations of refresh rates. It seems to be similar to issues
> with 75hz in a single monitor configuration.


In my case, both are Dell U2718Q monitors, the resolution is 4K (3840x2160),
and the refresh rate is 60Hz on both monitors.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15705430171.dB91bAe.28749
Date: Tue, 8 Oct 2019 13:56:57 +0000
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
   title=3D"NEW - AMD Navi10 GPU powerplay issues when using two DisplayPor=
t connectors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111913#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi10 GPU powerplay issues when using two DisplayPor=
t connectors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111913">bug 11191=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
venemo&#64;msn.com" title=3D"Timur Krist=C3=B3f &lt;venemo&#64;msn.com&gt;"=
> <span class=3D"fn">Timur Krist=C3=B3f</span></a>
</span></b>
        <pre>(In reply to Andrew Sheldon from <a href=3D"show_bug.cgi?id=3D=
111913#c5">comment #5</a>)
<span class=3D"quote">&gt; Are both monitors 60hz? I've seen this occur wit=
h 2x60hz setups, but not
&gt; with other combinations of refresh rates. It seems to be similar to is=
sues
&gt; with 75hz in a single monitor configuration.</span >


In my case, both are Dell U2718Q monitors, the resolution is 4K (3840x2160),
and the refresh rate is 60Hz on both monitors.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15705430171.dB91bAe.28749--

--===============0966049248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0966049248==--
