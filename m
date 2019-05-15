Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6891E84F
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 08:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F26B894EA;
	Wed, 15 May 2019 06:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE0B8894FE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 06:33:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E80F3721CD; Wed, 15 May 2019 06:33:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109380] [CI][BAT] igt@kms_chamelium@*suspend* - warn - Last
 errno: 113, No route to host
Date: Wed, 15 May 2019 06:33:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cibuglog@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109380-502-WTSeY25tcQ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109380-502@http.bugs.freedesktop.org/>
References: <bug-109380-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0600030532=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0600030532==
Content-Type: multipart/alternative; boundary="15579020300.Bf1a9.3217"
Content-Transfer-Encoding: 7bit


--15579020300.Bf1a9.3217
Date: Wed, 15 May 2019 06:33:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109380

--- Comment #3 from CI Bug Log <cibuglog@gmail.com> ---
A CI Bug Log filter associated to this bug has been updated:

{- CHAMELIUM: igt@kms_chamelium@*suspend* - warn - Last errno: 113, No rout=
e to
host -}
{+ CHAMELIUM: igt@kms_chamelium@* - warn/fail - Last errno: 113, No route to
host +}

New failures caught by the filter:

  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_284/fi-kbl-7500u/igt@kms_ch=
amelium@hdmi-cmp-planes-random.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_284/fi-kbl-7567u/igt@kms_ch=
amelium@hdmi-cmp-planes-random.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_285/fi-kbl-7500u/igt@kms_ch=
amelium@dp-audio.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_285/fi-kbl-7567u/igt@kms_ch=
amelium@dp-audio.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15579020300.Bf1a9.3217
Date: Wed, 15 May 2019 06:33:50 +0000
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
   title=3D"NEW - [CI][BAT] igt&#64;kms_chamelium&#64;*suspend* - warn - La=
st errno: 113, No route to host"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109380#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][BAT] igt&#64;kms_chamelium&#64;*suspend* - warn - La=
st errno: 113, No route to host"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109380">bug 10938=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cibuglog&#64;gmail.com" title=3D"CI Bug Log &lt;cibuglog&#64;gmail.com&gt;"=
> <span class=3D"fn">CI Bug Log</span></a>
</span></b>
        <pre>A CI Bug Log filter associated to this bug has been updated:

{- CHAMELIUM: igt&#64;kms_chamelium&#64;*suspend* - warn - Last errno: 113,=
 No route to
host -}
{+ CHAMELIUM: igt&#64;kms_chamelium&#64;* - warn/fail - Last errno: 113, No=
 route to
host +}

New failures caught by the filter:

  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_284/fi-kbl-7500u=
/igt&#64;kms_chamelium&#64;hdmi-cmp-planes-random.html">https://intel-gfx-c=
i.01.org/tree/drm-tip/drmtip_284/fi-kbl-7500u/igt&#64;kms_chamelium&#64;hdm=
i-cmp-planes-random.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_284/fi-kbl-7567u=
/igt&#64;kms_chamelium&#64;hdmi-cmp-planes-random.html">https://intel-gfx-c=
i.01.org/tree/drm-tip/drmtip_284/fi-kbl-7567u/igt&#64;kms_chamelium&#64;hdm=
i-cmp-planes-random.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_285/fi-kbl-7500u=
/igt&#64;kms_chamelium&#64;dp-audio.html">https://intel-gfx-ci.01.org/tree/=
drm-tip/drmtip_285/fi-kbl-7500u/igt&#64;kms_chamelium&#64;dp-audio.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_285/fi-kbl-7567u=
/igt&#64;kms_chamelium&#64;dp-audio.html">https://intel-gfx-ci.01.org/tree/=
drm-tip/drmtip_285/fi-kbl-7567u/igt&#64;kms_chamelium&#64;dp-audio.html</a>=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15579020300.Bf1a9.3217--

--===============0600030532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0600030532==--
