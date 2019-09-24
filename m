Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD75BC628
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 13:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B24C6E9EB;
	Tue, 24 Sep 2019 11:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 28BE76E9E9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 11:04:33 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 208DC72162; Tue, 24 Sep 2019 11:04:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111747] [CI][DRMTIP] igt@ - incomplete - Jenkins gives up
Date: Tue, 24 Sep 2019 11:04:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: cibuglog@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111747-502-JHkIl5X9f7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111747-502@http.bugs.freedesktop.org/>
References: <bug-111747-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0931240194=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0931240194==
Content-Type: multipart/alternative; boundary="15693230730.cd22EDa0.13005"
Content-Transfer-Encoding: 7bit


--15693230730.cd22EDa0.13005
Date: Tue, 24 Sep 2019 11:04:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111747

--- Comment #4 from CI Bug Log <cibuglog@gmail.com> ---
A CI Bug Log filter associated to this bug has been updated:

{- TGL: igt@gem_fenced_exec_thrash@no-spare-fences -incomplete  -}
{+ TGL: igt@* -incomplete - Abort requested by .* terminating children +}

New failures caught by the filter:

  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_373/fi-tgl-u/igt@kms_frontb=
uffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_373/fi-tgl-u/igt@kms_plane_=
alpha_blend@pipe-c-alpha-basic.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_373/fi-tgl-u/igt@kms_vblank=
@pipe-c-wait-forked.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_373/fi-tgl-u2/igt@kms_curso=
r_legacy@flip-vs-cursor-atomic-transitions.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_374/fi-tgl-u/igt@kms_cursor=
_legacy@pipe-a-forked-move.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_374/fi-tgl-u/igt@gem_busy@c=
lose-race.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_374/fi-tgl-u/igt@kms_big_fb=
@x-tiled-64bpp-rotate-180.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_374/fi-tgl-u2/igt@kms_flip@=
wf_vblank-ts-check-interruptible.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_374/fi-tgl-u2/igt@vgem_slow=
@nohang.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_375/fi-tgl-u/igt@kms_plane@=
plane-panning-bottom-right-pipe-a-planes.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_375/fi-tgl-u/igt@gem_cpu_re=
loc@forked.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_375/fi-tgl-u/igt@vgem_slow@=
nohang.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_375/fi-tgl-u/igt@drm_read@s=
hort-buffer-wakeup.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_376/fi-tgl-u/igt@kms_flip@w=
f_vblank-ts-check-interruptible.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_376/fi-tgl-u/igt@kms_plane_=
lowres@pipe-c-tiling-x.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_376/fi-tgl-u2/igt@gem_exec_=
flush@basic-uc-prw-default.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6944/fi-tgl-u/igt@gem_cpu_r=
eloc@basic.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt@gem_exec_p=
arallel@rcs0-fds.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt@kms_color@=
pipe-b-ctm-red-to-blue.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt@gem_busy@c=
lose-race.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt@i915_pm_rp=
m@gem-evict-pwrite.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt@kms_flip@n=
onexisting-fb.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt@kms_cursor=
_crc@pipe-c-cursor-64x21-random.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15693230730.cd22EDa0.13005
Date: Tue, 24 Sep 2019 11:04:33 +0000
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
   title=3D"NEW - [CI][DRMTIP] igt&#64; - incomplete - Jenkins gives up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][DRMTIP] igt&#64; - incomplete - Jenkins gives up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747">bug 11174=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cibuglog&#64;gmail.com" title=3D"CI Bug Log &lt;cibuglog&#64;gmail.com&gt;"=
> <span class=3D"fn">CI Bug Log</span></a>
</span></b>
        <pre>A CI Bug Log filter associated to this bug has been updated:

{- TGL: igt&#64;gem_fenced_exec_thrash&#64;no-spare-fences -incomplete  -}
{+ TGL: igt&#64;* -incomplete - Abort requested by .* terminating children =
+}

New failures caught by the filter:

  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_373/fi-tgl-u/igt=
&#64;kms_frontbuffer_tracking&#64;psr-1p-primscrn-cur-indfb-draw-mmap-wc.ht=
ml">https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_373/fi-tgl-u/igt&#64;km=
s_frontbuffer_tracking&#64;psr-1p-primscrn-cur-indfb-draw-mmap-wc.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_373/fi-tgl-u/igt=
&#64;kms_plane_alpha_blend&#64;pipe-c-alpha-basic.html">https://intel-gfx-c=
i.01.org/tree/drm-tip/drmtip_373/fi-tgl-u/igt&#64;kms_plane_alpha_blend&#64=
;pipe-c-alpha-basic.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_373/fi-tgl-u/igt=
&#64;kms_vblank&#64;pipe-c-wait-forked.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/drmtip_373/fi-tgl-u/igt&#64;kms_vblank&#64;pipe-c-wait-forked.ht=
ml</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_373/fi-tgl-u2/ig=
t&#64;kms_cursor_legacy&#64;flip-vs-cursor-atomic-transitions.html">https:/=
/intel-gfx-ci.01.org/tree/drm-tip/drmtip_373/fi-tgl-u2/igt&#64;kms_cursor_l=
egacy&#64;flip-vs-cursor-atomic-transitions.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_374/fi-tgl-u/igt=
&#64;kms_cursor_legacy&#64;pipe-a-forked-move.html">https://intel-gfx-ci.01=
.org/tree/drm-tip/drmtip_374/fi-tgl-u/igt&#64;kms_cursor_legacy&#64;pipe-a-=
forked-move.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_374/fi-tgl-u/igt=
&#64;gem_busy&#64;close-race.html">https://intel-gfx-ci.01.org/tree/drm-tip=
/drmtip_374/fi-tgl-u/igt&#64;gem_busy&#64;close-race.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_374/fi-tgl-u/igt=
&#64;kms_big_fb&#64;x-tiled-64bpp-rotate-180.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_374/fi-tgl-u/igt&#64;kms_big_fb&#64;x-tiled-64bpp-r=
otate-180.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_374/fi-tgl-u2/ig=
t&#64;kms_flip&#64;wf_vblank-ts-check-interruptible.html">https://intel-gfx=
-ci.01.org/tree/drm-tip/drmtip_374/fi-tgl-u2/igt&#64;kms_flip&#64;wf_vblank=
-ts-check-interruptible.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_374/fi-tgl-u2/ig=
t&#64;vgem_slow&#64;nohang.html">https://intel-gfx-ci.01.org/tree/drm-tip/d=
rmtip_374/fi-tgl-u2/igt&#64;vgem_slow&#64;nohang.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_375/fi-tgl-u/igt=
&#64;kms_plane&#64;plane-panning-bottom-right-pipe-a-planes.html">https://i=
ntel-gfx-ci.01.org/tree/drm-tip/drmtip_375/fi-tgl-u/igt&#64;kms_plane&#64;p=
lane-panning-bottom-right-pipe-a-planes.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_375/fi-tgl-u/igt=
&#64;gem_cpu_reloc&#64;forked.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/drmtip_375/fi-tgl-u/igt&#64;gem_cpu_reloc&#64;forked.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_375/fi-tgl-u/igt=
&#64;vgem_slow&#64;nohang.html">https://intel-gfx-ci.01.org/tree/drm-tip/dr=
mtip_375/fi-tgl-u/igt&#64;vgem_slow&#64;nohang.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_375/fi-tgl-u/igt=
&#64;drm_read&#64;short-buffer-wakeup.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/drmtip_375/fi-tgl-u/igt&#64;drm_read&#64;short-buffer-wakeup.html=
</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_376/fi-tgl-u/igt=
&#64;kms_flip&#64;wf_vblank-ts-check-interruptible.html">https://intel-gfx-=
ci.01.org/tree/drm-tip/drmtip_376/fi-tgl-u/igt&#64;kms_flip&#64;wf_vblank-t=
s-check-interruptible.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_376/fi-tgl-u/igt=
&#64;kms_plane_lowres&#64;pipe-c-tiling-x.html">https://intel-gfx-ci.01.org=
/tree/drm-tip/drmtip_376/fi-tgl-u/igt&#64;kms_plane_lowres&#64;pipe-c-tilin=
g-x.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_376/fi-tgl-u2/ig=
t&#64;gem_exec_flush&#64;basic-uc-prw-default.html">https://intel-gfx-ci.01=
.org/tree/drm-tip/drmtip_376/fi-tgl-u2/igt&#64;gem_exec_flush&#64;basic-uc-=
prw-default.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6944/fi-tgl-u/ig=
t&#64;gem_cpu_reloc&#64;basic.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_6944/fi-tgl-u/igt&#64;gem_cpu_reloc&#64;basic.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt=
&#64;gem_exec_parallel&#64;rcs0-fds.html">https://intel-gfx-ci.01.org/tree/=
drm-tip/drmtip_377/fi-tgl-u/igt&#64;gem_exec_parallel&#64;rcs0-fds.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt=
&#64;kms_color&#64;pipe-b-ctm-red-to-blue.html">https://intel-gfx-ci.01.org=
/tree/drm-tip/drmtip_377/fi-tgl-u/igt&#64;kms_color&#64;pipe-b-ctm-red-to-b=
lue.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt=
&#64;gem_busy&#64;close-race.html">https://intel-gfx-ci.01.org/tree/drm-tip=
/drmtip_377/fi-tgl-u/igt&#64;gem_busy&#64;close-race.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt=
&#64;i915_pm_rpm&#64;gem-evict-pwrite.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/drmtip_377/fi-tgl-u/igt&#64;i915_pm_rpm&#64;gem-evict-pwrite.html=
</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt=
&#64;kms_flip&#64;nonexisting-fb.html">https://intel-gfx-ci.01.org/tree/drm=
-tip/drmtip_377/fi-tgl-u/igt&#64;kms_flip&#64;nonexisting-fb.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt=
&#64;kms_cursor_crc&#64;pipe-c-cursor-64x21-random.html">https://intel-gfx-=
ci.01.org/tree/drm-tip/drmtip_377/fi-tgl-u/igt&#64;kms_cursor_crc&#64;pipe-=
c-cursor-64x21-random.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15693230730.cd22EDa0.13005--

--===============0931240194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0931240194==--
