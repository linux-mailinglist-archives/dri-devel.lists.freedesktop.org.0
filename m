Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B48E086F52
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 03:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D416ECEC;
	Fri,  9 Aug 2019 01:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2ED256ECE8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 01:27:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 26F9D72167; Fri,  9 Aug 2019 01:27:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110258] Lenovo V110-15AST AMD A9-9410  AMD R5 Stoney hangs
 after waking after suspend. 5.0 onwards
Date: Fri, 09 Aug 2019 01:27:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: eugene@bright.gdn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110258-502-SKqRP9DW24@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110258-502@http.bugs.freedesktop.org/>
References: <bug-110258-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1417313417=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1417313417==
Content-Type: multipart/alternative; boundary="15653140440.CBfCa93.13404"
Content-Transfer-Encoding: 7bit


--15653140440.CBfCa93.13404
Date: Fri, 9 Aug 2019 01:27:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110258

--- Comment #10 from Eugene Bright <eugene@bright.gdn> ---
Does someone work on the fix here?
Should this issue be reported to the kernel.org?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15653140440.CBfCa93.13404
Date: Fri, 9 Aug 2019 01:27:24 +0000
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
   title=3D"NEW - Lenovo V110-15AST AMD A9-9410 AMD R5 Stoney hangs after w=
aking after suspend. 5.0 onwards"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110258#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Lenovo V110-15AST AMD A9-9410 AMD R5 Stoney hangs after w=
aking after suspend. 5.0 onwards"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110258">bug 11025=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
eugene&#64;bright.gdn" title=3D"Eugene Bright &lt;eugene&#64;bright.gdn&gt;=
"> <span class=3D"fn">Eugene Bright</span></a>
</span></b>
        <pre>Does someone work on the fix here?
Should this issue be reported to the kernel.org?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15653140440.CBfCa93.13404--

--===============1417313417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1417313417==--
