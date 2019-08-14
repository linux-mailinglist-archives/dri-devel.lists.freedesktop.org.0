Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD18CEE1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 10:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028276E484;
	Wed, 14 Aug 2019 08:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66DB86E47C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 08:58:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 633407215A; Wed, 14 Aug 2019 08:58:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109246] HDMI connected monitors fail to sleep and instead turn
 back on when amdgpu.dc=1
Date: Wed, 14 Aug 2019 08:58:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jigglywiggly@3dslice.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109246-502-4axnt5jeyk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109246-502@http.bugs.freedesktop.org/>
References: <bug-109246-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0139594452=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0139594452==
Content-Type: multipart/alternative; boundary="15657731264.9f0dFcDc.25739"
Content-Transfer-Encoding: 7bit


--15657731264.9f0dFcDc.25739
Date: Wed, 14 Aug 2019 08:58:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109246

--- Comment #25 from jigglywiggly@3dslice.net ---
Are any logs needed? I am using a rx570 on a LG 27UD59-B and it keeps waking
itself up when it tries to sleep. amdgpu.dc=3D0 does fix it but then I get =
mouse
lag when I move my mouse quickly for long strokes.

This bug I feel is very important, not having basic sleep functionality is
really annoying. This did not happen to me when I used my nvidia 1060 3gb w=
ith
the proprietary driver.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657731264.9f0dFcDc.25739
Date: Wed, 14 Aug 2019 08:58:46 +0000
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
   title=3D"NEW - HDMI connected monitors fail to sleep and instead turn ba=
ck on when amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109246#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HDMI connected monitors fail to sleep and instead turn ba=
ck on when amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109246">bug 10924=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jigglywiggly&#64;3dslice.net" title=3D"jigglywiggly&#64;3dslice.net">jiggly=
wiggly&#64;3dslice.net</a>
</span></b>
        <pre>Are any logs needed? I am using a rx570 on a LG 27UD59-B and i=
t keeps waking
itself up when it tries to sleep. amdgpu.dc=3D0 does fix it but then I get =
mouse
lag when I move my mouse quickly for long strokes.

This bug I feel is very important, not having basic sleep functionality is
really annoying. This did not happen to me when I used my nvidia 1060 3gb w=
ith
the proprietary driver.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657731264.9f0dFcDc.25739--

--===============0139594452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0139594452==--
