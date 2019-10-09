Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1EDD1103
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 16:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05C46E9B2;
	Wed,  9 Oct 2019 14:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA7A56E9B5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 14:18:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A76F072162; Wed,  9 Oct 2019 14:18:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111921] GPU crash on VegaM (amdgpu: The CS has been rejected)
Date: Wed, 09 Oct 2019 14:18:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: andrey.grodzovsky@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111921-502-qy8ZjwyPP3@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111921-502@http.bugs.freedesktop.org/>
References: <bug-111921-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1777262703=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1777262703==
Content-Type: multipart/alternative; boundary="15706307112.590aeBE.28710"
Content-Transfer-Encoding: 7bit


--15706307112.590aeBE.28710
Date: Wed, 9 Oct 2019 14:18:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111921

--- Comment #9 from Andrey Grodzovsky <andrey.grodzovsky@amd.com> ---
(In reply to R=C3=A9mi Verschelde from comment #8)
> (In reply to Andrey Grodzovsky from comment #2)
> > Hey, I noticed a lot of 'amdgpu 0000:01:00.0: GPU pci config reset' the=
re.
>=20
> These actually happen every time I change the focus between an application
> running on the AMD GPU (with `DRI_PRIME=3D1`) and another application (e.=
g.
> desktop environment, firefox, terminal) running on the Intel HD 630 IGP
> (`DRI_PRIME=3D0`, default).

So i guess the problem only happens when you run in DRI PRIME mode when
different apps render of off different GPUs ?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15706307112.590aeBE.28710
Date: Wed, 9 Oct 2019 14:18:31 +0000
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
   title=3D"NEW - GPU crash on VegaM (amdgpu: The CS has been rejected)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111921#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU crash on VegaM (amdgpu: The CS has been rejected)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111921">bug 11192=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrey.grodzovsky&#64;amd.com" title=3D"Andrey Grodzovsky &lt;andrey.grodzo=
vsky&#64;amd.com&gt;"> <span class=3D"fn">Andrey Grodzovsky</span></a>
</span></b>
        <pre>(In reply to R=C3=A9mi Verschelde from <a href=3D"show_bug.cgi=
?id=3D111921#c8">comment #8</a>)
<span class=3D"quote">&gt; (In reply to Andrey Grodzovsky from <a href=3D"s=
how_bug.cgi?id=3D111921#c2">comment #2</a>)
&gt; &gt; Hey, I noticed a lot of 'amdgpu 0000:01:00.0: GPU pci config rese=
t' there.
&gt;=20
&gt; These actually happen every time I change the focus between an applica=
tion
&gt; running on the AMD GPU (with `DRI_PRIME=3D1`) and another application =
(e.g.
&gt; desktop environment, firefox, terminal) running on the Intel HD 630 IGP
&gt; (`DRI_PRIME=3D0`, default).</span >

So i guess the problem only happens when you run in DRI PRIME mode when
different apps render of off different GPUs ?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15706307112.590aeBE.28710--

--===============1777262703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1777262703==--
