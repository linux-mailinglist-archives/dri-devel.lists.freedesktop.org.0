Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EC79E601
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 12:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5554089A59;
	Tue, 27 Aug 2019 10:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BA5589A59
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 10:45:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5EC2F72161; Tue, 27 Aug 2019 10:45:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111498] [amdgpu, Ryzen 7 Pro 3700U] freeze when suspending
 shortly after wakeup
Date: Tue, 27 Aug 2019 10:45:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: rohan@rohanlean.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: priority
Message-ID: <bug-111498-502-RPq5llxQEt@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111498-502@http.bugs.freedesktop.org/>
References: <bug-111498-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1118740611=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1118740611==
Content-Type: multipart/alternative; boundary="15669027080.C7d79eE.23288"
Content-Transfer-Encoding: 7bit


--15669027080.C7d79eE.23288
Date: Tue, 27 Aug 2019 10:45:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111498

Rohan Lean <rohan@rohanlean.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|not set                     |high

--- Comment #1 from Rohan Lean <rohan@rohanlean.de> ---
I should mention: the messages are in reverse chronological order, so "PM:
suspend entry (s2idle)" (notably "s2idle" instead of "deep") is the last
message logged before reset.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15669027080.C7d79eE.23288
Date: Tue, 27 Aug 2019 10:45:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:rohan&#64=
;rohanlean.de" title=3D"Rohan Lean &lt;rohan&#64;rohanlean.de&gt;"> <span c=
lass=3D"fn">Rohan Lean</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amdgpu, Ryzen 7 Pro 3700U] freeze when suspending shortl=
y after wakeup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111498">bug 11149=
8</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Priority</td>
           <td>not set
           </td>
           <td>high
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amdgpu, Ryzen 7 Pro 3700U] freeze when suspending shortl=
y after wakeup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111498#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amdgpu, Ryzen 7 Pro 3700U] freeze when suspending shortl=
y after wakeup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111498">bug 11149=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rohan&#64;rohanlean.de" title=3D"Rohan Lean &lt;rohan&#64;rohanlean.de&gt;"=
> <span class=3D"fn">Rohan Lean</span></a>
</span></b>
        <pre>I should mention: the messages are in reverse chronological or=
der, so &quot;PM:
suspend entry (s2idle)&quot; (notably &quot;s2idle&quot; instead of &quot;d=
eep&quot;) is the last
message logged before reset.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15669027080.C7d79eE.23288--

--===============1118740611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1118740611==--
