Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6F43CCC5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 15:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22FB891B9;
	Tue, 11 Jun 2019 13:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 98ABF891B9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 13:15:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9582772167; Tue, 11 Jun 2019 13:15:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110896] [CI][RESUME] igt@kms_chamelium@hdmi-audio - warn - Home
 directory not accessible: Permission denied
Date: Tue, 11 Jun 2019 13:15:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: martin.peres@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: contact@emersion.fr
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to status_whiteboard
Message-ID: <bug-110896-502-fT47axoJzn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110896-502@http.bugs.freedesktop.org/>
References: <bug-110896-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0722447825=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0722447825==
Content-Type: multipart/alternative; boundary="15602589272.14E7afef.1026"
Content-Transfer-Encoding: 7bit


--15602589272.14E7afef.1026
Date: Tue, 11 Jun 2019 13:15:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110896

Martin Peres <martin.peres@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|dri-devel@lists.freedesktop |contact@emersion.fr
                   |.org                        |
         Whiteboard|                            |ReadyForDev

--- Comment #1 from Martin Peres <martin.peres@free.fr> ---
Assigning Simon since he wrote the test, and it should not need to warn abo=
ut
permission issues UNLESS it needed to dump results and couldn't.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602589272.14E7afef.1026
Date: Tue, 11 Jun 2019 13:15:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:martin.pe=
res&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <=
span class=3D"fn">Martin Peres</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME] igt&#64;kms_chamelium&#64;hdmi-audio - warn =
- Home directory not accessible: Permission denied"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110896">bug 11089=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>contact&#64;emersion.fr
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Whiteboard</td>
           <td>
               &nbsp;
           </td>
           <td>ReadyForDev
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME] igt&#64;kms_chamelium&#64;hdmi-audio - warn =
- Home directory not accessible: Permission denied"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110896#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME] igt&#64;kms_chamelium&#64;hdmi-audio - warn =
- Home directory not accessible: Permission denied"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110896">bug 11089=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>Assigning Simon since he wrote the test, and it should not nee=
d to warn about
permission issues UNLESS it needed to dump results and couldn't.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602589272.14E7afef.1026--

--===============0722447825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0722447825==--
