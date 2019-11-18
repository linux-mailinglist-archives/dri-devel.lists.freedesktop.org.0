Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D16BF100CFD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 21:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB90D6E81D;
	Mon, 18 Nov 2019 20:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E29486E81D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:17:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D95F5720E2; Mon, 18 Nov 2019 20:17:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112303] [LENOVO E595] Black screen on resume!
Date: Mon, 18 Nov 2019 20:17:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dracaphallus@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112303-502-sD4RF0X7c2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112303-502@http.bugs.freedesktop.org/>
References: <bug-112303-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1123311143=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1123311143==
Content-Type: multipart/alternative; boundary="15741082330.91fa74.3952"
Content-Transfer-Encoding: 7bit


--15741082330.91fa74.3952
Date: Mon, 18 Nov 2019 20:17:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112303

--- Comment #2 from Icy_Thought <dracaphallus@gmail.com> ---
(In reply to Alex Deucher from comment #1)
> Does it work with kernel 5.4?  There were several fixes for resume that w=
ere
> added (which will be making their way back to stable kernels).

Can't answer this question until kernel 5.4 has been pushed to the Arch Lin=
ux
repositories. Will report back when I receive an update!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15741082330.91fa74.3952
Date: Mon, 18 Nov 2019 20:17:13 +0000
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
   title=3D"NEW - [LENOVO E595] Black screen on resume!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112303#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [LENOVO E595] Black screen on resume!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112303">bug 11230=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dracaphallus&#64;gmail.com" title=3D"Icy_Thought &lt;dracaphallus&#64;gmail=
.com&gt;"> <span class=3D"fn">Icy_Thought</span></a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D11=
2303#c1">comment #1</a>)
<span class=3D"quote">&gt; Does it work with kernel 5.4?  There were severa=
l fixes for resume that were
&gt; added (which will be making their way back to stable kernels).</span >

Can't answer this question until kernel 5.4 has been pushed to the Arch Lin=
ux
repositories. Will report back when I receive an update!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15741082330.91fa74.3952--

--===============1123311143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1123311143==--
