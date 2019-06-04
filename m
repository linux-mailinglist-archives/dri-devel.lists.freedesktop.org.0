Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C6342C0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 11:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EC289623;
	Tue,  4 Jun 2019 09:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8EAC689623
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 09:11:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8B54E72167; Tue,  4 Jun 2019 09:11:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110422] AMD_DEBUG=forcedma will crash OpenGL aps with SIGFAULT
 on VegaM 8706G
Date: Tue, 04 Jun 2019 09:11:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: phusho@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110422-502-e93JFZciXN@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110422-502@http.bugs.freedesktop.org/>
References: <bug-110422-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0282048380=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0282048380==
Content-Type: multipart/alternative; boundary="15596395121.6903.5963"
Content-Transfer-Encoding: 7bit


--15596395121.6903.5963
Date: Tue, 4 Jun 2019 09:11:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110422

--- Comment #3 from Dimitar Atanasov <phusho@yahoo.com> ---
Working correct now with Vega M. Please close.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596395121.6903.5963
Date: Tue, 4 Jun 2019 09:11:52 +0000
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
   title=3D"NEW - AMD_DEBUG=3Dforcedma will crash OpenGL aps with SIGFAULT =
on VegaM 8706G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110422#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD_DEBUG=3Dforcedma will crash OpenGL aps with SIGFAULT =
on VegaM 8706G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110422">bug 11042=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
phusho&#64;yahoo.com" title=3D"Dimitar Atanasov &lt;phusho&#64;yahoo.com&gt=
;"> <span class=3D"fn">Dimitar Atanasov</span></a>
</span></b>
        <pre>Working correct now with Vega M. Please close.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596395121.6903.5963--

--===============0282048380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0282048380==--
