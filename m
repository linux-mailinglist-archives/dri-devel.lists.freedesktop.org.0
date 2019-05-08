Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B93181D8
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 23:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649448979E;
	Wed,  8 May 2019 21:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CC838979E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 21:58:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 34EBA721AA; Wed,  8 May 2019 21:58:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110641] lm_sensors reports "ERROR: Can't get value of
 subfeature in0_input: Can't read"
Date: Wed, 08 May 2019 21:58:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bong.cosca@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110641-502-4KdxJiQl8e@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110641-502@http.bugs.freedesktop.org/>
References: <bug-110641-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2062224683=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2062224683==
Content-Type: multipart/alternative; boundary="15573527081.9e6f.11549"
Content-Transfer-Encoding: 7bit


--15573527081.9e6f.11549
Date: Wed, 8 May 2019 21:58:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110641

--- Comment #2 from Bong Cosca <bong.cosca@gmail.com> ---
It wasn't the case before when VDDGFX and VDDNB were not exposed. Are these
(and the missing in0_input/in1_input probes) present on APUs?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15573527081.9e6f.11549
Date: Wed, 8 May 2019 21:58:28 +0000
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
   title=3D"NEW - lm_sensors reports &quot;ERROR: Can't get value of subfea=
ture in0_input: Can't read&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110641#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - lm_sensors reports &quot;ERROR: Can't get value of subfea=
ture in0_input: Can't read&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110641">bug 11064=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bong.cosca&#64;gmail.com" title=3D"Bong Cosca &lt;bong.cosca&#64;gmail.com&=
gt;"> <span class=3D"fn">Bong Cosca</span></a>
</span></b>
        <pre>It wasn't the case before when VDDGFX and VDDNB were not expos=
ed. Are these
(and the missing in0_input/in1_input probes) present on APUs?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15573527081.9e6f.11549--

--===============2062224683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2062224683==--
