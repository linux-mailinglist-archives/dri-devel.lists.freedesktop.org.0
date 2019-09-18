Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E497B5FB2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 10:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91E06EE5B;
	Wed, 18 Sep 2019 08:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF1756EE5B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 08:59:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A70C572167; Wed, 18 Sep 2019 08:59:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111730] Xorg does not render with mesa 19.1.7
Date: Wed, 18 Sep 2019 08:59:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/i915
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: lionel.g.landwerlin@linux.intel.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-111730-502-kmwKvaaCLJ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111730-502@http.bugs.freedesktop.org/>
References: <bug-111730-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1094250465=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1094250465==
Content-Type: multipart/alternative; boundary="15687971790.09Fd537.29276"
Content-Transfer-Encoding: 7bit


--15687971790.09Fd537.29276
Date: Wed, 18 Sep 2019 08:59:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111730

Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #4 from Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>=
 ---
Could you us more details about your setup?

I assume you're not just running bare X11 with no window manager/compositor?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687971790.09Fd537.29276
Date: Wed, 18 Sep 2019 08:59:39 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:lionel.g.=
landwerlin&#64;linux.intel.com" title=3D"Lionel Landwerlin &lt;lionel.g.lan=
dwerlin&#64;linux.intel.com&gt;"> <span class=3D"fn">Lionel Landwerlin</spa=
n></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Xorg does not render with mesa 19.1.7"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111730">bug 11173=
0</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Xorg does not render with mesa 19.1.7"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111730#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Xorg does not render with mesa 19.1.7"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111730">bug 11173=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lionel.g.landwerlin&#64;linux.intel.com" title=3D"Lionel Landwerlin &lt;lio=
nel.g.landwerlin&#64;linux.intel.com&gt;"> <span class=3D"fn">Lionel Landwe=
rlin</span></a>
</span></b>
        <pre>Could you us more details about your setup?

I assume you're not just running bare X11 with no window manager/compositor=
?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687971790.09Fd537.29276--

--===============1094250465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1094250465==--
