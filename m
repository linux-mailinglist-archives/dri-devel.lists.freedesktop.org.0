Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 379312CB5E4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 08:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8336E9A6;
	Wed,  2 Dec 2020 07:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4946E9A6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 07:49:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE8EEAC2D;
 Wed,  2 Dec 2020 07:49:10 +0000 (UTC)
To: "tiantao (H)" <tiantao6@huawei.com>, Tian Tao <tiantao6@hisilicon.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <1606823754-52451-1-git-send-email-tiantao6@hisilicon.com>
 <1606823754-52451-2-git-send-email-tiantao6@hisilicon.com>
 <fc644426-67db-7128-5f73-8630373ab0e8@suse.de>
 <3f235e08-bb58-be41-8e92-ccd2dfd68b33@huawei.com>
 <389548c9-772c-d86b-700e-032f7d7bde1f@suse.de>
 <51e7e774-6795-8eeb-6701-b1cccc4c6199@huawei.com>
 <5093b12f-11e8-0cf0-d9e7-7ec9b52e364d@suse.de>
 <9cd5daa7-c934-c834-f2f6-f9b7f7e6b590@huawei.com>
 <8360f2e5-252c-2323-fb36-ad7083f8bda9@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH drm/hisilicon v2 1/4] drm/hisilicon: Assgin local variable
 to drm_device
Message-ID: <6ce6f2b4-4541-a8a4-7081-ac52106d238e@suse.de>
Date: Wed, 2 Dec 2020 08:49:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8360f2e5-252c-2323-fb36-ad7083f8bda9@huawei.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1577540297=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1577540297==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qznlTRCYbn9jyoWgNLYoVWbi0FuU0cyPI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qznlTRCYbn9jyoWgNLYoVWbi0FuU0cyPI
Content-Type: multipart/mixed; boundary="XqpZdCQMYoXwczn2OSepYX6z5YKF10Kmu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "tiantao (H)" <tiantao6@huawei.com>, Tian Tao <tiantao6@hisilicon.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <6ce6f2b4-4541-a8a4-7081-ac52106d238e@suse.de>
Subject: Re: [PATCH drm/hisilicon v2 1/4] drm/hisilicon: Assgin local variable
 to drm_device
References: <1606823754-52451-1-git-send-email-tiantao6@hisilicon.com>
 <1606823754-52451-2-git-send-email-tiantao6@hisilicon.com>
 <fc644426-67db-7128-5f73-8630373ab0e8@suse.de>
 <3f235e08-bb58-be41-8e92-ccd2dfd68b33@huawei.com>
 <389548c9-772c-d86b-700e-032f7d7bde1f@suse.de>
 <51e7e774-6795-8eeb-6701-b1cccc4c6199@huawei.com>
 <5093b12f-11e8-0cf0-d9e7-7ec9b52e364d@suse.de>
 <9cd5daa7-c934-c834-f2f6-f9b7f7e6b590@huawei.com>
 <8360f2e5-252c-2323-fb36-ad7083f8bda9@huawei.com>
In-Reply-To: <8360f2e5-252c-2323-fb36-ad7083f8bda9@huawei.com>

--XqpZdCQMYoXwczn2OSepYX6z5YKF10Kmu
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.12.20 um 03:54 schrieb tiantao (H):
>=20
>=20
> =E5=9C=A8 2020/12/2 10:06, tiantao (H) =E5=86=99=E9=81=93:
>>
>>
>> =E5=9C=A8 2020/12/1 21:44, Thomas Zimmermann =E5=86=99=E9=81=93:
>>> Hi
>>>
>>> Am 01.12.20 um 14:05 schrieb tiantao (H):
>>>>
>>>>
>>>> =E5=9C=A8 2020/12/1 20:36, Thomas Zimmermann =E5=86=99=E9=81=93:
>>>>> Hi
>>>>>
>>>>> Am 01.12.20 um 13:26 schrieb tiantao (H):
>>>>>>
>>>>>>
>>>>>> =E5=9C=A8 2020/12/1 20:17, Thomas Zimmermann =E5=86=99=E9=81=93:
>>>>>>> Hi
>>>>>>>
>>>>>>> Am 01.12.20 um 12:55 schrieb Tian Tao:
>>>>>>>> Assign local variable to struct drm_device *dev because they are=

>>>>>>>> used multiple times within a function.
>>>>>>>>
>>>>>>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>>>>>>> ---
>>>>>>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c=C2=A0=C2=A0=
 |=C2=A0 2 +-
>>>>>>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c=C2=A0 | 3=
0=20
>>>>>>>> ++++++++++++------------
>>>>>>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h=C2=A0 |=C2=
=A0 2 +-
>>>>>>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |=C2=A0 =
2 +-
>>>>>>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 8 ++++---
>>>>>>>> =C2=A0 5 files changed, 23 insertions(+), 21 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c=20
>>>>>>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
>>>>>>>> index ea962ac..096eea9 100644
>>>>>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
>>>>>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
>>>>>>>> @@ -499,7 +499,7 @@ static const struct drm_crtc_helper_funcs=20
>>>>>>>> hibmc_crtc_helper_funcs =3D {
>>>>>>>> =C2=A0 int hibmc_de_init(struct hibmc_drm_private *priv)
>>>>>>>> =C2=A0 {
>>>>>>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D priv->dev;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_crtc *crtc =3D &priv->=
crtc;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_plane *plane =3D &priv=
->primary_plane;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c=20
>>>>>>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>>>>>> index d845657..dd9fadc 100644
>>>>>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>>>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>>>>>> @@ -79,31 +79,32 @@ static const struct dev_pm_ops hibmc_pm_ops =
=3D {
>>>>>>>> =C2=A0 static int hibmc_kms_init(struct hibmc_drm_private *priv)=

>>>>>>>> =C2=A0 {
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 drm_mode_config_init(priv->dev);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 drm_mode_config_init(dev);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->mode_config_initialized =3D=
 true;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.min_width =3D 0;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.min_height =3D 0;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.max_width =3D 1920;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.max_height =3D 1200;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.min_width =3D 0;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.min_height =3D 0;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.max_width =3D 1920;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.max_height =3D 1200;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.fb_base =3D priv->fb_=
base;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.preferred_depth =3D 3=
2;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.prefer_shadow =3D 1;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.fb_base =3D priv->fb_base;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.preferred_depth =3D 32;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.prefer_shadow =3D 1;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.funcs =3D (void *)&hi=
bmc_mode_funcs;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.funcs =3D (void *)&hibmc_mo=
de_funcs;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hibmc_de_init(priv);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(priv->dev, "=
failed to init de: %d\n", ret);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(dev, "failed=
 to init de: %d\n", ret);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return re=
t;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hibmc_vdac_init(priv);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(priv->dev, "=
failed to init vdac: %d\n", ret);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(dev, "failed=
 to init vdac: %d\n", ret);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return re=
t;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> @@ -113,7 +114,7 @@ static int hibmc_kms_init(struct=20
>>>>>>>> hibmc_drm_private *priv)
>>>>>>>> =C2=A0 static void hibmc_kms_fini(struct hibmc_drm_private *priv=
)
>>>>>>>> =C2=A0 {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (priv->mode_config_initialized=
) {
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mode_config_clea=
nup(priv->dev);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mode_config_clea=
nup(&priv->dev);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->mod=
e_config_initialized =3D false;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> =C2=A0 }
>>>>>>>> @@ -202,7 +203,7 @@ static void hibmc_hw_config(struct=20
>>>>>>>> hibmc_drm_private *priv)
>>>>>>>> =C2=A0 static int hibmc_hw_map(struct hibmc_drm_private *priv)
>>>>>>>> =C2=A0 {
>>>>>>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D priv->dev;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pci_dev *pdev =3D dev->pde=
v;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resource_size_t addr, size, ioadd=
r, iosize;
>>>>>>>> @@ -258,7 +259,7 @@ static int hibmc_unload(struct drm_device *d=
ev)
>>>>>>>> =C2=A0 static int hibmc_load(struct drm_device *dev)
>>>>>>>> =C2=A0 {
>>>>>>>> -=C2=A0=C2=A0=C2=A0 struct hibmc_drm_private *priv;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct hibmc_drm_private *priv =3D to_hibmc_=
drm_private(dev);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv =3D drmm_kzalloc(dev, sizeof=
(*priv), GFP_KERNEL);
>>>>>>>> @@ -267,7 +268,6 @@ static int hibmc_load(struct drm_device *dev=
)
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -E=
NOMEM;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->dev_private =3D priv;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev =3D dev;
>>>>>>>
>>>>>>> I'm sure this either does not build or does not work. There's a=20
>>>>>>> call to drm_dev_alloc(), which initialized the DRM device. You=20
>>>>>>> need to assign the returned device here. The embedding of dev=20
>>>>>>> only work after you switched to devm_drm_dev_alloc() in the next =

>>>>>>> patch.
>>>>>>>
>>>>>>> For the patch at hand, just keep struct hibmc_drm_private.dev as =

>>>>>>> a pointer and you should be fine.
>>>>>>>
>>>>>> Changing drm_device *dev to drm_device dev and using=20
>>>>>> devm_drm_dev_alloc does not easily split into two patches.
>>>>>> The patch does not compile well on its own, but it will compile=20
>>>>>> fine with patch #2.
>>>>>> Can patch #1 and patch #2 be combined into a single patch,just=20
>>>>>> like V1.
>>>>>
>>>>> Most of the code in this patch does
>>>>>
>>>>> =C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>>>>
>>>>> to get dev as a local variable. Why don't you do
>>>>>
>>>>> =C2=A0=C2=A0 struct drm_device *dev =3D priv->dev;
>>>>>
>>>>> ?
>>>>>
>>>>> That's all that's really needed.
>>>>
>>>> +=C2=A0=C2=A0=C2=A0 priv =3D devm_drm_dev_alloc(&pdev->dev, &hibmc_d=
river,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hibmc_drm_private, dev);
>>>> devm_drm_dev_alloc function requires parameter 4, dev must be a=20
>>>> non-pointer for it to work. so had to change dev in the=20
>>>> hibmc_drm_private=C2=A0 to non-pointer.
>>>> This is also the reason to change drm_device *dev to drm_device dev.=

>>>
>>> Yes, but that's what patch 2 is about. Patch 1 is about simplifying=20
>>> these pointer dereferences into local variables. For this, all you=20
>>> need is
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_device *dev =3D priv->dev;
>> I'm sorry, I still don't understand what you mean.The latest code on=20
>> the drm branch looks like this "struct drm_device *dev =3D priv->dev;"=

>> If I change the dev of hibmc_drm_private to local variables, I won't=20
>> be able to assign it like this "struct drm_device *dev =3D priv->dev;"=
,=20
>> right?
>>>
>>> In patch 2, these lines are then changed to
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_device *dev =3D &priv->dev;
>>>
>>> That makes 2 self-contained patches.
> patch #1
> first changed drm_device *dev to drm_device dev
> then
>  =C2=A0drm =3D &priv->dev;
>  =C2=A0err =3D drm_dev_init(drm, &hibmc_drm_private , &pdev->dev);
> patch #2
>=20
> using devm_drm_dev_alloc()
>=20
> Is this right ?

Oh, I guess I now see why we're misunderstanding each other. By local=20
variable, I mean that dev is a local pointer in a function. I didn't=20
mean that the actual instance of dev is stored in struct=20
hibmc_drm_private. In patch 1 it's still supposed to be a pointer in=20
struct hibmc_drm_private. Only patch 2 will make dev an instance.

Anyway, before this goes on forever, maybe just merge patches 1 and 2=20
and resubmit.

Best regards
Thomas

>=20
>>>
>>> Best regards
>>> Thomas
>>>
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>>> Best regards
>>>>>>> Thomas
>>>>>>>
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hibmc_hw_init(priv);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>>>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h=20
>>>>>>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>>>>>> index f310a83..e35353a 100644
>>>>>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>>>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>>>>>> @@ -37,7 +37,7 @@ struct hibmc_drm_private {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resource_size_t=C2=A0 fb_size;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* drm */
>>>>>>>> -=C2=A0=C2=A0=C2=A0 struct drm_device=C2=A0 *dev;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device dev;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_plane primary_plane;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_crtc crtc;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_encoder encoder;
>>>>>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c=20
>>>>>>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>>>>>>> index 74e26c2..d35548d 100644
>>>>>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>>>>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>>>>>>> @@ -96,7 +96,7 @@ static const struct drm_encoder_funcs=20
>>>>>>>> hibmc_encoder_funcs =3D {
>>>>>>>> =C2=A0 int hibmc_vdac_init(struct hibmc_drm_private *priv)
>>>>>>>> =C2=A0 {
>>>>>>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D priv->dev;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hibmc_connector *hibmc_con=
nector =3D &priv->connector;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_encoder *encoder =3D &=
priv->encoder;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector *connector =3D=
 &hibmc_connector->base;
>>>>>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c=20
>>>>>>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>>>>>>>> index 602ece1..e84fb81 100644
>>>>>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>>>>>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>>>>>>>> @@ -25,7 +25,7 @@ int hibmc_mm_init(struct hibmc_drm_private=20
>>>>>>>> *hibmc)
>>>>>>>> =C2=A0 {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_vram_mm *vmm;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D hibmc->dev;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &hibmc->dev;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmm =3D drm_vram_helper_alloc_mm(=
dev,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pci_resource_start(dev->pdev, 0),
>>>>>>>> @@ -41,10 +41,12 @@ int hibmc_mm_init(struct hibmc_drm_private=20
>>>>>>>> *hibmc)
>>>>>>>> =C2=A0 void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
>>>>>>>> =C2=A0 {
>>>>>>>> -=C2=A0=C2=A0=C2=A0 if (!hibmc->dev->vram_mm)
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &hibmc->dev;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!dev->vram_mm)
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 drm_vram_helper_release_mm(hibmc->dev);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 drm_vram_helper_release_mm(dev);
>>>>>>>> =C2=A0 }
>>>>>>>> =C2=A0 int hibmc_dumb_create(struct drm_file *file, struct drm_d=
evice=20
>>>>>>>> *dev,
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>>
>> .
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--XqpZdCQMYoXwczn2OSepYX6z5YKF10Kmu--

--qznlTRCYbn9jyoWgNLYoVWbi0FuU0cyPI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/HRvUFAwAAAAAACgkQlh/E3EQov+Ao
8xAArP5MGijq0qDIo4XLNXKDA4QKHHRK1YMuQH/djaMotom4CHb4nVkkW2rtWzLoPH8hhHHSHAgI
oV3V54b7TVeZWXi80fQfhtESAEy5u9BzWvJAp86eRJlWjyDyvYQIihTbvdFjY8Po8Li0SUZr/Wvc
YONHRel1X2TItDf/4GBgzVy15WU9v/1i/GfTaAnv6J31EjGnQV2JDx9dS/oRFYNwlWPY8q1d+rar
srJTWJkyDGnaHEvfmjfnfMXweFGWPMW/FMnd/99/mt4i/Gw6heDcCrsuFAIn8RfmW93BmeYr8OLg
+JR3nfnOzpewt+vJzimIGR7QiDux6mbsvQjPgIV1/nH4OvGRAeukuzEDe/le/MBnEDAM/LjCKmSF
YPruAwp4jj8bUlUagpujpOAjSWIZpFDEjTemMX3ptDh2utqgbWZiOkZ2NG36Wp2GiYFpyDrezk7t
E3Gaj+XeEJye+AkWvfNCTY5swRtYdQ13h11qFHOmI+DiEmLYYhILMWWGjq80Fg4/k3wuVpE9BEtC
RociUCBK1lakn3FgSeESvo6SAYuEn7KYyDgPRPIO9cA/7V+dxJG/v5iSh5ftxya5PxiB00x2VzlQ
rQXmcVqI1pvnzJ2ytBuEqQp5suxu6WfmIKdBifenT6gP3S5RudvYZ91dvwFmPPcZ4GZO6cnVUjLn
e/Q=
=4dUm
-----END PGP SIGNATURE-----

--qznlTRCYbn9jyoWgNLYoVWbi0FuU0cyPI--

--===============1577540297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1577540297==--
