Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA3E6CC3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 08:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BC66E3DF;
	Mon, 28 Oct 2019 07:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB4306E3E1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 07:13:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C7FF3720E2; Mon, 28 Oct 2019 07:13:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111240] RX 560x is very slow
Date: Mon, 28 Oct 2019 07:13:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: jajcus@jajcus.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-111240-502-6YuASxdBF5@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111240-502@http.bugs.freedesktop.org/>
References: <bug-111240-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0398930087=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0398930087==
Content-Type: multipart/alternative; boundary="15722468244.B10cf1B9.22855"
Content-Transfer-Encoding: 7bit


--15722468244.B10cf1B9.22855
Date: Mon, 28 Oct 2019 07:13:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111240

Jacek Konieczny <jajcus@jajcus.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jajcus@jajcus.net

--- Comment #6 from Jacek Konieczny <jajcus@jajcus.net> ---
I have a similar laptop (TUF Gaming FX505DY), and the very same problem, wi=
th
kernel 5.3.7 and governor set to 'performance'.

When I run a game with DRI_PRIME=3D1 (to use the dedicated GPU) the system =
gets
throttled down at some point and never recovers. Every CPU core runs at 400=
Mhz
which makes the system practically unusable until reboot.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15722468244.B10cf1B9.22855
Date: Mon, 28 Oct 2019 07:13:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:jajcus&#6=
4;jajcus.net" title=3D"Jacek Konieczny &lt;jajcus&#64;jajcus.net&gt;"> <spa=
n class=3D"fn">Jacek Konieczny</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 560x is very slow"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240">bug 11124=
0</a>
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
           <td>jajcus&#64;jajcus.net
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 560x is very slow"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 560x is very slow"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240">bug 11124=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jajcus&#64;jajcus.net" title=3D"Jacek Konieczny &lt;jajcus&#64;jajcus.net&g=
t;"> <span class=3D"fn">Jacek Konieczny</span></a>
</span></b>
        <pre>I have a similar laptop (TUF Gaming FX505DY), and the very sam=
e problem, with
kernel 5.3.7 and governor set to 'performance'.

When I run a game with DRI_PRIME=3D1 (to use the dedicated GPU) the system =
gets
throttled down at some point and never recovers. Every CPU core runs at 400=
Mhz
which makes the system practically unusable until reboot.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15722468244.B10cf1B9.22855--

--===============0398930087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0398930087==--
