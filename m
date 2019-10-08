Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC05CF00B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 02:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDB36E196;
	Tue,  8 Oct 2019 00:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7EB1D6E1A8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 00:57:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7B90772162; Tue,  8 Oct 2019 00:57:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110865] Rx480 consumes 20w more power in idle than under Windows
Date: Tue, 08 Oct 2019 00:57:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110865-502-4Ta6Rm3GLO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110865-502@http.bugs.freedesktop.org/>
References: <bug-110865-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1254393644=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1254393644==
Content-Type: multipart/alternative; boundary="15704962223.0defF.21816"
Content-Transfer-Encoding: 7bit


--15704962223.0defF.21816
Date: Tue, 8 Oct 2019 00:57:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110865

--- Comment #37 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
(In reply to tempel.julian from comment #36)
> (In reply to Dieter N=C3=BCtzel from comment #28)
> > I've tried solving the flicker with both fixes (sent by magist3r) from =
this
> > bug
> >=20
> > Bug 102646 - Screen flickering under amdgpu-experimental [buggy auto po=
wer
> > profile]
> > https://bugs.freedesktop.org/show_bug.cgi?id=3D102646
> >=20
> > But no success.
>=20
> Have you also applied Ahzo's patch, just in case?

Thanks for the hint.

v2 is already in 'amd-staging-drm-next'
f659bb6dae58c113805f92822e4c16ddd3156b79
drm/amd/powerplay/smu7: enforce minimal VBITimeout (v2)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15704962223.0defF.21816
Date: Tue, 8 Oct 2019 00:57:02 +0000
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
   title=3D"NEW - Rx480 consumes 20w more power in idle than under Windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110865#c37">Comme=
nt # 37</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rx480 consumes 20w more power in idle than under Windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110865">bug 11086=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>(In reply to tempel.julian from <a href=3D"show_bug.cgi?id=3D1=
10865#c36">comment #36</a>)
<span class=3D"quote">&gt; (In reply to Dieter N=C3=BCtzel from <a href=3D"=
show_bug.cgi?id=3D110865#c28">comment #28</a>)
&gt; &gt; I've tried solving the flicker with both fixes (sent by magist3r)=
 from this
&gt; &gt; bug
&gt; &gt;=20
&gt; &gt; <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"show_bug.cgi?id=3D102646">Bug 102646</a> - Screen flickering und=
er amdgpu-experimental [buggy auto power
&gt; &gt; profile]
&gt; &gt; <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"show_bug.cgi?id=3D102646">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D102646</a>
&gt; &gt;=20
&gt; &gt; But no success.
&gt;=20
&gt; Have you also applied Ahzo's patch, just in case?</span >

Thanks for the hint.

v2 is already in 'amd-staging-drm-next'
f659bb6dae58c113805f92822e4c16ddd3156b79
drm/amd/powerplay/smu7: enforce minimal VBITimeout (v2)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15704962223.0defF.21816--

--===============1254393644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1254393644==--
