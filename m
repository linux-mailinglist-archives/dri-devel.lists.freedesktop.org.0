Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E49FBED69
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B109A6ECC5;
	Thu, 26 Sep 2019 08:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E4CB6ECC5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:30:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9A79972162; Thu, 26 Sep 2019 08:30:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAxMTE3NjFdIExhdGVzdCBHaXQgS2VybmVsIGRvZXNu4oCZdCBib290?=
 =?UTF-8?B?IHdpdGggUmFkZW9uIE5JIHdpdGggdGhlIGRybS1uZXh0LTIwMTktMDktMTgg?=
 =?UTF-8?B?dXBkYXRlcw==?=
Date: Thu, 26 Sep 2019 08:30:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111761-502-Vt8RqX0U0E@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111761-502@http.bugs.freedesktop.org/>
References: <bug-111761-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1244120053=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1244120053==
Content-Type: multipart/alternative; boundary="15694866361.b354a5c.29746"
Content-Transfer-Encoding: 7bit


--15694866361.b354a5c.29746
Date: Thu, 26 Sep 2019 08:30:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111761

--- Comment #8 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
Alex,

Success!

I compiled the latest Git kernel with this patch today. After that I could =
boot
this kernel with my Radeon NI graphics cards without any problems!

Many thanks for this patch!

Cheers,
Christian

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15694866361.b354a5c.29746
Date: Thu, 26 Sep 2019 08:30:36 +0000
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
   title=3D"NEW - Latest Git Kernel doesn=E2=80=99t boot with Radeon NI wit=
h the drm-next-2019-09-18 updates"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111761#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest Git Kernel doesn=E2=80=99t boot with Radeon NI wit=
h the drm-next-2019-09-18 updates"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111761">bug 11176=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chzigotzky&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;=
xenosoft.de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span></b>
        <pre>Alex,

Success!

I compiled the latest Git kernel with this patch today. After that I could =
boot
this kernel with my Radeon NI graphics cards without any problems!

Many thanks for this patch!

Cheers,
Christian</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15694866361.b354a5c.29746--

--===============1244120053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1244120053==--
