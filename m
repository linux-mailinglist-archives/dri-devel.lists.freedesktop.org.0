Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A069FDEE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 11:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C0A899AB;
	Wed, 28 Aug 2019 09:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C8B8899AB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 09:10:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8941E72161; Wed, 28 Aug 2019 09:10:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107825] *ERROR* Couldn't read Speaker Allocation Data Block: -2
Date: Wed, 28 Aug 2019 09:10:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jdelvare@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-107825-502-ghIG3im5ia@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107825-502@http.bugs.freedesktop.org/>
References: <bug-107825-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0090294682=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0090294682==
Content-Type: multipart/alternative; boundary="15669834182.1a52e.22882"
Content-Transfer-Encoding: 7bit


--15669834182.1a52e.22882
Date: Wed, 28 Aug 2019 09:10:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107825

Jean Delvare <jdelvare@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jdelvare@suse.de

--- Comment #2 from Jean Delvare <jdelvare@suse.de> ---
I see the same error messages on a Dell Optiplex 9020 with an AMD Radeon R5=
 240
(Oland), when my Dell 24" display is connected with a DisplayPort cable. I =
do
not have the errors when connected with a DVI or VGA cable.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15669834182.1a52e.22882
Date: Wed, 28 Aug 2019 09:10:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:jdelvare&=
#64;suse.de" title=3D"Jean Delvare &lt;jdelvare&#64;suse.de&gt;"> <span cla=
ss=3D"fn">Jean Delvare</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - *ERROR* Couldn't read Speaker Allocation Data Block: -2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107825">bug 10782=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>jdelvare&#64;suse.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - *ERROR* Couldn't read Speaker Allocation Data Block: -2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107825#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - *ERROR* Couldn't read Speaker Allocation Data Block: -2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107825">bug 10782=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jdelvare&#64;suse.de" title=3D"Jean Delvare &lt;jdelvare&#64;suse.de&gt;"> =
<span class=3D"fn">Jean Delvare</span></a>
</span></b>
        <pre>I see the same error messages on a Dell Optiplex 9020 with an =
AMD Radeon R5 240
(Oland), when my Dell 24&quot; display is connected with a DisplayPort cabl=
e. I do
not have the errors when connected with a DVI or VGA cable.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15669834182.1a52e.22882--

--===============0090294682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0090294682==--
