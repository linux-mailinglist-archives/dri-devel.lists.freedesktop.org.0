Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D42DB2C6BE
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 14:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7941E89FEC;
	Tue, 28 May 2019 12:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 835AA89F85
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 12:38:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 806DC72167; Tue, 28 May 2019 12:38:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110725] [CI][SHARDS]
 igt@kms_big_fb@(linear|x-tiled|y-tiled)-(16|32|64)bpp-rotate-(90|270) - skip
 - unsupported configuration, SKIP
Date: Tue, 28 May 2019 12:38:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lakshminarayana.vudum@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to qa_contact
Message-ID: <bug-110725-502-CcL9xQMxHO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110725-502@http.bugs.freedesktop.org/>
References: <bug-110725-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0548441609=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0548441609==
Content-Type: multipart/alternative; boundary="15590471351.4Bb4bd833.5118"
Content-Transfer-Encoding: 7bit


--15590471351.4Bb4bd833.5118
Date: Tue, 28 May 2019 12:38:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110725

Lakshmi <lakshminarayana.vudum@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|DRM/Intel                   |IGT
           Assignee|intel-gfx-bugs@lists.freede |dri-devel@lists.freedesktop
                   |sktop.org                   |.org
         QA Contact|intel-gfx-bugs@lists.freede |
                   |sktop.org                   |

--- Comment #8 from Lakshmi <lakshminarayana.vudum@intel.com> ---
IGT test has to be fixed so that we don't commit unsupported rotation format
tiling combinations.=20
Test coverage for max fb is decreased.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15590471351.4Bb4bd833.5118
Date: Tue, 28 May 2019 12:38:55 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:lakshmina=
rayana.vudum&#64;intel.com" title=3D"Lakshmi &lt;lakshminarayana.vudum&#64;=
intel.com&gt;"> <span class=3D"fn">Lakshmi</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][SHARDS] igt&#64;kms_big_fb&#64;(linear|x-tiled|y-til=
ed)-(16|32|64)bpp-rotate-(90|270) - skip - unsupported configuration, SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110725">bug 11072=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/Intel
           </td>
           <td>IGT
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>
               &nbsp;
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][SHARDS] igt&#64;kms_big_fb&#64;(linear|x-tiled|y-til=
ed)-(16|32|64)bpp-rotate-(90|270) - skip - unsupported configuration, SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110725#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][SHARDS] igt&#64;kms_big_fb&#64;(linear|x-tiled|y-til=
ed)-(16|32|64)bpp-rotate-(90|270) - skip - unsupported configuration, SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110725">bug 11072=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lakshminarayana.vudum&#64;intel.com" title=3D"Lakshmi &lt;lakshminarayana.v=
udum&#64;intel.com&gt;"> <span class=3D"fn">Lakshmi</span></a>
</span></b>
        <pre>IGT test has to be fixed so that we don't commit unsupported r=
otation format
tiling combinations.=20
Test coverage for max fb is decreased.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15590471351.4Bb4bd833.5118--

--===============0548441609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0548441609==--
