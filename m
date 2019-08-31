Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE95A4300
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 09:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FA76E17F;
	Sat, 31 Aug 2019 07:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF93D6E176
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 07:14:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C7B8B72161; Sat, 31 Aug 2019 07:14:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sat, 31 Aug 2019 07:14:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: alexandr.kara@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-111481-502-KBekr7RA6M@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0244864374=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0244864374==
Content-Type: multipart/alternative; boundary="15672356500.cA824A.29603"
Content-Transfer-Encoding: 7bit


--15672356500.cA824A.29603
Date: Sat, 31 Aug 2019 07:14:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

Alexandr K=C3=A1ra <alexandr.kara@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexandr.kara@gmail.com

--- Comment #6 from Alexandr K=C3=A1ra <alexandr.kara@gmail.com> ---
Might be related to https://bugs.freedesktop.org/show_bug.cgi?id=3D111269. =
I also
get the "ring gfx_0.0.0 timeout" error (but not the "ring sdma0 timeout"
error).=20

Using LLVM from git + Mesa 19.2.0-rc1 on Fedora 30 with kernel from Fedora =
31
(5.3.0-0.rc5.git0.1.fc31.x86_64). GPU AMD Radeon RX 5700 XT, CPU AMD Ryzen 7
1700, 32 GB RAM (EDD).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15672356500.cA824A.29603
Date: Sat, 31 Aug 2019 07:14:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:alexandr.=
kara&#64;gmail.com" title=3D"Alexandr K=C3=A1ra &lt;alexandr.kara&#64;gmail=
.com&gt;"> <span class=3D"fn">Alexandr K=C3=A1ra</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
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
           <td>alexandr.kara&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexandr.kara&#64;gmail.com" title=3D"Alexandr K=C3=A1ra &lt;alexandr.kara&=
#64;gmail.com&gt;"> <span class=3D"fn">Alexandr K=C3=A1ra</span></a>
</span></b>
        <pre>Might be related to <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GFX10: &quot;Random&quot; GPU hangs with Rise Of The Tomb=
 Raider"
   href=3D"show_bug.cgi?id=3D111269">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111269</a>. I also
get the &quot;ring gfx_0.0.0 timeout&quot; error (but not the &quot;ring sd=
ma0 timeout&quot;
error).=20

Using LLVM from git + Mesa 19.2.0-rc1 on Fedora 30 with kernel from Fedora =
31
(5.3.0-0.rc5.git0.1.fc31.x86_64). GPU AMD Radeon RX 5700 XT, CPU AMD Ryzen 7
1700, 32 GB RAM (EDD).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15672356500.cA824A.29603--

--===============0244864374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0244864374==--
